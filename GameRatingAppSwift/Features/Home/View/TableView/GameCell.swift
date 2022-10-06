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
    var gameDescriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(gameImageView)
        addSubview(gameTitleLabel)
        addSubview(gameDescriptionLabel)
        
        configureImageView()
        configureTitleLabel()
        configureDescriptionLabel()
        
        setImageConstraints()
        setTitleLabelConstraints()
        setDescriptionLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setGame(game: GameModel) {
      
            gameImageView.sd_setImage(with: URL(string: game.backgroundImage!))
            gameTitleLabel.text = game.name
            if let releaseDate = game.released {
                if let rating = game.rating {
                    gameDescriptionLabel.text = "\(rating)  \(releaseDate)"
                }
           
            
            }
         

        
    }
    
    func configureImageView() {
        gameImageView.layer.cornerRadius = 10
        gameImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        gameTitleLabel.numberOfLines = 0
        gameTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configureDescriptionLabel() {
        gameDescriptionLabel.numberOfLines = 0
        gameDescriptionLabel.adjustsFontSizeToFitWidth = true
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
            gameTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant:  -10),
            gameTitleLabel.leadingAnchor.constraint(equalTo: gameImageView.trailingAnchor,constant: 20),
            gameTitleLabel.heightAnchor.constraint(equalToConstant: 50),
            gameTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -12)
        
        ])
        
    }
    func setDescriptionLabelConstraints() {
        gameDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gameDescriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor,constant: 15),
            gameDescriptionLabel.leadingAnchor.constraint(equalTo: gameImageView.trailingAnchor,constant: 20),
            gameDescriptionLabel.heightAnchor.constraint(equalToConstant: 40),
            gameDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -12)
        
        ])
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
