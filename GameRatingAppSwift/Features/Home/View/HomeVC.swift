//
//  HomeVC.swift
//  GameRatingAppSwift
//
//  Created by Mustafa Çiçek on 10.09.2022.
//

import UIKit

class HomeVC: UIViewController {

    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Downloading.."
        
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        
        label.textAlignment = .center
        
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .white
        // Do any additional setup after loading the view.
        view.addSubview(messageLabel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        messageLabel.frame = CGRect(x: view.frame.width/2 - 100 , y: view.frame.height/2 - 25, width: 200, height: 50)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
