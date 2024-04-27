//
//  UserTargetType.swift
//  34th-Sopt-Seminar
//
//  Created by 이수민 on 4/27/24.
//

//2단계, api 요청에 필요한 정보를 담은 파일 UserTargetType
import Foundation

import Moya


enum UserTargetType {
    case getUserInfo(memberId: String)
    case signUp(request: SignUpRequestModel)
    case login(request: LoginRequestModel) //로그인 서버 연동 작성 (3)
}

//로그인 서버 연동 작성 (3) -> case login 추가, 일일이 모든 var에 case login 정보에 대해 추가해주자
//다 했으면 다시 UserService으로 이동!
extension UserTargetType: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .signUp:
            return "/member/join"
        case .getUserInfo(memberId: let memberId):
            return "/member/info"
        case .login:
            return "/member/login"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signUp:
            return .post
        case .getUserInfo:
            return .get
        case .login:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .signUp(let request):
            return .requestJSONEncodable(request) //request = body
        case .getUserInfo:
            return .requestPlain
        case .login(let request):
            return .requestJSONEncodable(request)
        } //어떤 방식으로 소통할 것인지
    }
    
    var headers: [String : String]? {
        switch self {
        case.signUp:
            return ["Content-Type": "application/json"]
        case .getUserInfo(let memberId):
            return ["Content-Type": "application/json",
                    "memberId" : memberId]
        case .login:
            return ["Content-Type": "application/json"]
        }
        
    }
}

