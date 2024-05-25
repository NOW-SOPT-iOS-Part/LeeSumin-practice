//
//  LoginRequestModel.swift
//  34th-Sopt-Seminar
//
//  Created by 이수민 on 4/27/24.
//

//로그인 서버 연동 작성 (1)
import Foundation

struct LoginRequestModel: Codable {
    let authenticationId: String
    let password: String
} 

