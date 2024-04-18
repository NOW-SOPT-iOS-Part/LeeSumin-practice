//
//  WelcomeViewController_DelegatePattern.swift
//  34th-Sopt-Seminar
//
//  Created by 이수민 on 4/6/24.
//

import Foundation
import UIKit

protocol DataBindProtocol: AnyObject {
    func dataBind(id: String?)
}

final class WelcomeViewController_DelegatePattern: UIViewController{
    weak var delegate: DataBindProtocol?
    var id: String? = ""

    private func bindID() {
        guard let idText = id else { return }
        self.welcomeLabel.text = "\(idText)님 \n반가워요!"
        
        /*
         if let idText = id{
             self.welcomeLabel.text = "\(idText)님 \n반가워요!"
         } else{
             print("id값이 없습니다.")
         }
         */
        
        // guard let vs if let - 옵셔널 바인딩
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupLayout()
        bindID()
    }
    
    private func setupLayout() {
        [logoImageView, welcomeLabel, goHomeButton, backToLoginButton].forEach {
            // $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
        logoImageView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(87)
            $0.width.height.equalTo(150)
        }
        welcomeLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(295)
            $0.width.equalTo(95)
            $0.height.equalTo(60)
        }
        goHomeButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(426)
            $0.width.equalTo(335)
            $0.height.equalTo(58)
        }
        backToLoginButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(498)
            $0.width.equalTo(335)
            $0.height.equalTo(58)
        }
    }
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo2")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.shadowColor = .systemOrange
        return label
    }()
    
    private var goHomeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.layer.cornerRadius = 28
        return button
    }()
    
    private var backToLoginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 28
        return button
    }()
    
    @objc private func backToLoginButtonDidTap() {
        if let id = id{
            delegate?.dataBind(id: id)
        }
        self.navigationController?.popViewController(animated: true)
        
    }
}
