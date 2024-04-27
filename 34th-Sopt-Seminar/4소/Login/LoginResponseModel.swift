//
//  LoginResponseModel.swift
//  34th-Sopt-Seminar
//
//  Created by 이수민 on 4/27/24.
//

// 로그인 서버 연동 작성 (4) -> login response model 만들자
// 다 했으면 다시 userservice으로 이동!
import Foundation

struct LoginResponseModel: Codable {
    let code: Int
    let message: String
}
