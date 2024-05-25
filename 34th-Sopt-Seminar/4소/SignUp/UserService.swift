//
//  UserService.swift
//  34th-Sopt-Seminar
//
//  Created by 이수민 on 4/27/24.
//

//3단계, 실제로 서버에 요청을 보내는 역할
import Foundation

import Moya

final class UserService {
    static let shared = UserService()
    private var userProvider = MoyaProvider<UserTargetType>(plugins: [MoyaLoggingPlugin()])
    
    private init() {}
}

extension UserService {
    func getUserInfo(memberId: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        userProvider.request(.getUserInfo(memberId: memberId)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data, UserInfoResponseModel.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            } //일단 응답 자체가 안 왔다는 건 네트워크 이슈
        } //응답 옴? 분
    }
     
    //로그인 서버 연동 작성 (2)
    func login(request: LoginRequestModel, completion: @escaping (NetworkResult<Any>) -> Void){
        //앗 userProvider의 UserTargetType에 case login이 없네! UserTargetType에 login 만들러가야지 !!
        userProvider.request(.login(request: request)){ result in
            switch result{
            case .success(let response):
                print("성공")
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data, LoginResponseModel.self)
                //LoginResponseModel 만들러 가자!
                completion(networkResult)
            
            case .failure:
                completion(.networkFail)
            }
            
        }
    } // 다 썼으면 다시 loginVC로 가서 마무리!
    
    func signUp(request: SignUpRequestModel, completion: @escaping (NetworkResult<Any>) -> Void) {
        userProvider.request(.signUp(request: request)) { result in
            switch result {
            case .success(let response):
                print("🫶 memberID는 \(String(describing: response.response?.allHeaderFields["Location"]))")
                
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data, SignUpResponseModel.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    
    
    
    public func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ object: T.Type) -> NetworkResult<Any> {
        
        switch statusCode {
        case 200..<205:
            return isValidData(data: data, T.self)
        case 400..<500:
            return .requestErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    } //응답 success? 분기처리
    
    
    private func isValidData<T: Codable>(data: Data, _ object: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            print("⛔️ \(self)애서 디코딩 오류가 발생했습니다 ⛔️")
            return .pathErr }
        
        return .success(decodedData as Any)
    } // 4단계: 데이터 디코딩 분기처리
}
