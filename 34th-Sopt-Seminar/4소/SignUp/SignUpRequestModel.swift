//
//  SignUpRequestModel.swift
//  34th-Sopt-Seminar
//
//  Created by 이수민 on 4/27/24.
//

import Foundation

struct SignUpRequestModel: Codable {
    let authenticationId: String
    let password: String
    let nickname: String
    let phone: String
}
