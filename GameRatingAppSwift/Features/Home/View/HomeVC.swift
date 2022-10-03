//
//  HomeVC.swift
//  GameRatingAppSwift
//
//  Created by Mustafa Çiçek on 10.09.2022.
//

import UIKit
import Kingfisher
import SwiftUI

class HomeVC: UIViewController  {
    lazy var tableView: UITableView = {
        
        let tableView = UITableView()
        // custom cell always register required
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        

        return tableView
    }()
    lazy var homeViewModel: HomeViewModel<Games> = {
        return HomeViewModel<Games>(homeService: HomeService(), delegate: self)
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
           scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(views.count), height: view.frame.height/3)
           
           for i in 0..<views.count {
               scrollView.addSubview(views[i])
               views[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height/3)
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
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        setupView()
        fetchGames()
        
      
      
        
   
    }
    
    private func fetchGames() {
        DispatchQueue.global(qos: .background).async {
            self.homeViewModel.fetchGameItems()
        }
    }
    
    func setupView() {
        allAddSubviews()
        
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, size: .init(width: view.frame.width, height: view.frame.height/3))
        
        pageControl.anchor(top: scrollView.bottomAnchor, leading: nil, bottom: nil, trailing: scrollView.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.width, height: 20))
        tableView.anchor(top: pageControl.bottomAnchor, leading: nil, bottom: nil, trailing: pageControl.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.width, height: view.frame.height * 0.4))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func allAddSubviews()  {
        [scrollView,pageControl ,tableView ].forEach {view.addSubview($0) }
   
    }
    
    @objc
    func pageControlTapHandler(sender: UIPageControl) {
        scrollView.scrollTo(horizontalPage: sender.currentPage, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let games = homeViewModel.gameItems.results {
            cell.textLabel?.text = homeViewModel.gameItems.results?[indexPath.row].name ?? "nil"
        }
      
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.gameItems.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }


   }

extension HomeVC: UIScrollViewDelegate , UITableViewDelegate, UITableViewDataSource {
  
 
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
         //       self.loadingIndicator.startAnimating()
            } else {
           //     self.loadingIndicator.stopAnimating()
             //   self.loadingIndicator.isHidden = true
            }
        }
    }
    

    func updateTableView(items: Games) {
      // tableView.updateItems(todoItemms: items)
        tableView.reloadData()

    }

   

}
