//
//  LoginViewController_DelegatePattern.swift
//  34th-Sopt-Seminar
//
//  Created by 이수민 on 4/6/24.
//

import UIKit
import Foundation
import SnapKit

class LoginViewController_DelegatePattern: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupLayout()
    }
    
    private func setupLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            self.view.addSubview($0)
        }
        titleLabel.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(161)
            make.centerX.equalToSuperview()
            make.width.equalTo(236)
            make.height.equalTo(52)
        }
        idTextField.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(276)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(52)
        }
        passwordTextField.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(335)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(52)
        }
        loginButton.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(422)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(58)
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        return label
    }()

    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디를 입력해주세요"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 25
        textField.addLeftPadding()
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 25
        textField.addLeftPadding()
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 28
        return button
    }()
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_DelegatePattern()
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
        welcomeViewController.delegate = self
        welcomeViewController.id = idTextField.text
    }
    
    func showIdAlert() {
        let alert = UIAlertController(title: "아이디 오류", message: "아이디를 입력해주세요", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showPasswordAlert() {
        let alert = UIAlertController(title: "비밀번호 오류", message: "비밀번호를 입력해주세요", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func loginButtonDidTap() {
        if idTextField.text!.count == 0{
            showIdAlert()
        }
        if passwordTextField.text!.count == 0{
            showPasswordAlert()
        }
        else{
            pushToWelcomeVC()
        }
    }
}


extension LoginViewController_DelegatePattern: DataBindProtocol {
    func dataBind(id: String?) {
        idTextField.text = "\(id ?? "no id")"
    }
}
