//
//  HomeVC.swift
//  GameRatingAppSwift
//
//  Created by Mustafa Çiçek on 10.09.2022.
//

import UIKit
import Kingfisher
import SwiftUI

class HomeVC: UIViewController {
    lazy var tableView: UITableView = {

        let tableView = UITableView()
        // custom cell always register required
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")


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




    lazy var view0: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        let label = UILabel()
        label.text = "Page 0"
        label.textAlignment = .center
        view.addSubview(label)
        label.edgeTo(view: view)
        return view
    }()
    
    

    lazy var view1: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        let label = UILabel()
        label.text = "Page 1"
        label.textAlignment = .center
        view.addSubview(label)
        label.edgeTo(view: view)
        return view
    }()

    lazy var view2: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        let label = UILabel()
        label.text = "Page 2"
        label.textAlignment = .center
        view.addSubview(label)
        label.edgeTo(view: view)
        return view
    }()

    lazy var views = [view0, view1, view2]

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
            print(self.gameItems.count)
            self.homeTableViewProvider.updateItems(gameItems: gameItems)
            self.tableView.reloadData()

        }
    }




}
