//
//  NewsTableViewCell.swift
//  jbcnews
//
//  Created by cagla copuroglu on 11.11.2022.
//

import UIKit
import AlamofireImage
import SnapKit

class NewsTableCell: UITableViewCell {
    static let identifier: String = "news_cell"
    var label: UILabel!
    private let customImage: UIImageView = UIImageView()
    let shadowHeight: CGFloat = 10
    let shadowPath = CGMutablePath()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String? ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configure()
    }

    //TODO: Shadow and rounded look.
    func configure() {
        label = UILabel(frame: .zero)
        self.contentView.addSubview(label)
        self.contentView.addSubview(customImage)
        
        label.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(102)
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        label.numberOfLines = 2
        label.font = UIFont(name: "Kanit-Medium", size: 13)

        customImage.snp.makeConstraints { (make) in
            make.height.equalTo(70)
            make.width.equalTo(70)
            make.top.equalTo(contentView).offset(16)
            make.left.equalToSuperview().offset(16)
        }
        
        //corners
        customImage.layer.cornerRadius = contentView.frame.height / 2
        self.contentView.layer.cornerRadius = self.contentView.frame.height / 2
        
        //shadow
        self.contentView.clipsToBounds = false
        self.contentView.layer.masksToBounds = false
        self.contentView.layer.shadowColor = UIColor.lightGray.cgColor
        self.contentView.layer.shadowOpacity = 1
    
             

        //background
        //self.contentView.backgroundColor = UIColor(named: "NewsBG")


    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func saveModel(news: NewsPresentation, index: Int) {
        label.text = news.title
        customImage.af.setImage(withURL: URL(string: news.imageUrl) ?? URL(string: "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/C5QHOVSEN6ZEFI3A3KDXGY65R4.jpg&w=1440")!)
//        customImage.af.setImage(withURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/back/23.png")!)
    }
    
    

}
