//
//  LoginViewController_CustomView.swift
//  34th-Sopt-Seminar
//
//  Created by 이수민 on 4/20/24.
//

import UIKit

final class LoginViewController_CustomView: UIViewController {
    
    private let rootView = LoginView()

    override func loadView() {
        self.view = rootView
    }
}
