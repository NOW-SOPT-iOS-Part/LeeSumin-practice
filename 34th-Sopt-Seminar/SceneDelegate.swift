//
//  SceneDelegate.swift
//  34th-Sopt-Seminar
//
//  Created by 이수민 on 2024/03/30.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // 1.
        guard let windowScene = (scene as? UIWindowScene) else { return }
    // 2.
        self.window = UIWindow(windowScene: windowScene)
    // 3.
        let navigationController = UINavigationController(rootViewController: ItemViewController())
        self.window?.rootViewController = navigationController
    // 4.
        self.window?.makeKeyAndVisible()
    }
}

/*
 1. 와일드카드로 설정된 변수(_)를 windowScene으로 이름을 바꾼다!
 2. UIWindowScene으로 타입캐스팅된 해당하는 변수를 SceneDelegate의 window 프로퍼티에 넣어줍니다. → (scene as? UIWindowScene)
 3. `**  rootViewController는 storyboard상에서 IsInitialViewController 로 설정해주는 것과 유사합니다!`
 4. window.makeKeyAndVisible()을 통해 화면이 나오는 것을 확인하실 수 있습니다!
 */
