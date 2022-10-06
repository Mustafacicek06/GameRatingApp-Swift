//
//  HomeVC.swift
//  GameRatingAppSwift
//
//  Created by Mustafa Çiçek on 10.09.2022.
//

import UIKit
import SDWebImage
import SwiftUI


class HomeVC: UIViewController {
    lazy var tableView: UITableView = {

        let tableView = UITableView()
        // custom cell always register required
        tableView.register(GameCell.self, forCellReuseIdentifier: Cells.gameCell)
        tableView.rowHeight = view.bounds.height * 0.09


        return tableView
    }()
    var gameItems: [GameModel] = []
    lazy var homeViewModel: HomeViewModel<Games> = {
        return HomeViewModel<Games>(homeService: HomeService(), delegate: self)
    }()

    lazy var loadingIndicator: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView()
        loading.color = .systemBlue

        return loading

    }()

    lazy var homeTableViewProvider: HomeTableViewProvider = {
        print(homeViewModel.gameItems.count)
    
        return HomeTableViewProvider(gameItems: gameItems)
    }()




    lazy var image1: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemTeal
        image.sd_setImage(with: URL(string: "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80"))
        
        view.addSubview(image)
        
        return image
    }()
    
    

    lazy var image2: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemTeal
        image.sd_setImage(with: URL(string: "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80"))
        
        view.addSubview(image)
        
        return image
    }()

    lazy var image3: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemTeal
        image.sd_setImage(with: URL(string: "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80"))
        
        view.addSubview(image)
        
        return image
    }()

    lazy var views = [image1, image2, image3]

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(views.count), height: view.frame.height / 3)

        for i in 0..<views.count {
            scrollView.addSubview(views[i])
            views[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height / 3)
        }

        scrollView.delegate = self

        return scrollView
    }()

    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = views.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.backgroundStyle = .prominent

        pageControl.addTarget(self, action: #selector(pageControlTapHandler(sender:)), for: .touchUpInside)
        return pageControl
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        initDelegate()
        
        setupView()
        fetchGames()
        

    }
    private func initDelegate() {
        self.tableView.delegate = homeTableViewProvider
        self.tableView.dataSource = homeTableViewProvider
        homeTableViewProvider.delegate = homeViewModel
        
    }
    private func fetchGames() {
        DispatchQueue.global(qos: .background).async {
            self.homeViewModel.fetchGameItems()
        }

    }

    private func setupView() {
        allAddSubviews()

        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, size: .init(width: view.frame.width, height: view.frame.height / 3))

        pageControl.anchor(top: scrollView.bottomAnchor, leading: nil, bottom: nil, trailing: scrollView.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.width, height: 20))
        tableView.anchor(top: pageControl.bottomAnchor, leading: nil, bottom: nil, trailing: pageControl.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.width, height: view.frame.height * 0.4))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func allAddSubviews() {
        [scrollView, pageControl, tableView].forEach { view.addSubview($0) }

    }

    @objc
    func pageControlTapHandler(sender: UIPageControl) {
        scrollView.scrollTo(horizontalPage: sender.currentPage, animated: true)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }



}

extension HomeVC: UIScrollViewDelegate {


    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}



extension HomeVC: HomeViewControllerProtocol {


    func navigateToDetail(item: GameModel, selectedIndex: Int) {
        /*
        guard let todoDetailViewController = HomeVie else { return }
               todoDetailViewController.todo = item
               todoDetailViewController.selectedIndex = selectedIndex
               DispatchQueue.main.async {
                   self.present(todoDetailViewController, animated: true, completion: nil)
               }
         */
    }

    func showError(description: String) {

    }

    func changeLoading(value: Bool) {
        DispatchQueue.main.async {
            if value {
                self.loadingIndicator.startAnimating()
            } else {
                self.loadingIndicator.stopAnimating()
                self.loadingIndicator.isHidden = true
            }
        }
    }


    func updateTableView(items: [GameModel]) {


        self.gameItems = homeViewModel.gameItems
        DispatchQueue.main.async { [self] in
           homeTableViewProvider.updateItems(gameItems: gameItems)
           tableView.reloadData()
            updateImageViews()
          

        }
    }
    func updateImageViews(){
       
            image1.sd_setImage(with: URL(string: gameItems[0].backgroundImage!))
            image2.sd_setImage(with: URL(string: gameItems[1].backgroundImage!))
            image3.sd_setImage(with: URL(string: gameItems[2].backgroundImage!))
        
    }



}
