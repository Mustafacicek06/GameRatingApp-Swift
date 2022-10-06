//
//  GameCell.swift
//  GameRatingAppSwift
//
//  Created by Mustafa Çiçek on 7.10.2022.
//

import UIKit

class GameCell: UITableViewCell {

    var gameImageView = UIImageView()
    var gameTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(gameImageView)
        addSubview(gameTitleLabel)
        
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setGame(game: GameModel) {
       
        gameImageView.sd_setImage(with: URL(string: game.backgroundImage!))
        gameTitleLabel.text = game.name
    }
    
    func configureImageView() {
        gameImageView.layer.cornerRadius = 10
        gameImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        gameTitleLabel.numberOfLines = 0
        gameTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints()  {
        gameImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            gameImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            gameImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            gameImageView.heightAnchor.constraint(equalToConstant: 50),
            gameImageView.widthAnchor.constraint(equalTo: gameImageView.heightAnchor, multiplier: 16/9)
            
        ])
        
    }
    
    func setTitleLabelConstraints() {
        gameTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gameTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            gameTitleLabel.leadingAnchor.constraint(equalTo: gameImageView.trailingAnchor,constant: 20),
            gameTitleLabel.heightAnchor.constraint(equalToConstant: 50),
            gameTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -12)
        
        ])
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
