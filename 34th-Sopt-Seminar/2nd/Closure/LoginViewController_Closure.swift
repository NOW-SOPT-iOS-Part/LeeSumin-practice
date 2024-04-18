//
//  LoginViewController_Closure.swift
//  34th-Sopt-Seminar
//
//  Created by 이수민 on 4/6/24.
//

import UIKit
import Foundation

class LoginViewController_Closure: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupLayout()
    }
    
    private func setupLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            self.view.addSubview($0)
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        return label
    }()

    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디를 입력해주세요"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 25
        textField.addLeftPadding()
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 25
        textField.addLeftPadding()
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 422, width: 332, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 28
        return button
    }()
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Closure()
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
        welcomeViewController.completionHandler = { [weak self] id in
            guard let self else { return }
            self.idTextField.text = "\(id)에서 어떤걸로 할꺼얌?"
        }
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

