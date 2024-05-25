//
//  SignUpResponseModel.swift
//  34th-Sopt-Seminar
//
//  Created by 이수민 on 4/27/24.
//

// 4단계 : 서버에서 보내주는 응답 (Response) 모델
import Foundation

struct SignUpResponseModel: Codable {
    let code: Int
    let message: String
}
