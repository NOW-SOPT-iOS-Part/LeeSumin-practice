//
//  ChatTableViewCell.swift
//  34th-Sopt-Seminar
//
//  Created by 이수민 on 4/20/24.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    static let identifier = "ChatTableViewCell" //식별자 정의해줘야 한다 !!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout(){
        [profileImageView, profileNameLabel, profileAddressLabel, lastChatLabel, itemImageView].forEach{
            self.addSubview($0)
        }
        
        profileImageView.snp.makeConstraints{
            $0.top.bottom.leading.equalToSuperview().inset(16)
            $0.width.equalTo(40)
            // $0.height.equalTo(40)
        }
        profileNameLabel.snp.makeConstraints{
            $0.top.equalTo(profileImageView.snp.top)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
            $0.height.equalTo(18)
        }
        profileAddressLabel.snp.makeConstraints{
            $0.leading.equalTo(profileNameLabel.snp.trailing).offset(2)
            $0.centerX.equalTo(profileNameLabel.snp.centerX)
            $0.height.equalTo(14)
        }
        lastChatLabel.snp.makeConstraints{
            $0.top.equalTo(profileNameLabel.snp.bottom).offset(4)
            $0.leading.equalTo(profileNameLabel.snp.leading)
            $0.bottom.equalToSuperview().inset(16)
        }
        itemImageView.snp.makeConstraints{
            $0.top.bottom.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(40)
        }
    }
    
    private let profileImageView : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let profileNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-Bold", size: 15)
        return label
    }()
    
    private let profileAddressLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 156, green: 156, blue: 156, alpha: 1)
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 12)
        return label
    }()
    
    private let lastChatLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 14)
        return label
    }()
    
    private let itemImageView : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
}


extension ChatTableViewCell {
    func dataBind(_ chatData: ChatModel) {
        profileImageView.image = chatData.profileImg
        profileNameLabel.text = chatData.name
        profileAddressLabel.text = chatData.place
        lastChatLabel.text = chatData.message
        itemImageView.image = chatData.itemImg
    }//셀에 데이터 뿌리기
}
