//
//  ChatViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 이수민 on 4/20/24.
//

import UIKit
import SnapKit

final class ChatViewController: UIViewController{ // -- 1번
    
    private let tableView = UITableView(frame: .zero, style: .plain) // -- 2번
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setDelegate()
        register()
    }
    
    private func setLayout() { // -- 3번
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    private func register() {
        tableView.register(
            ChatTableViewCell.self,
            forCellReuseIdentifier: ChatTableViewCell.identifier
        )
    } // cell register -> 어떤 cell 등록할지, 그 cell 식별자
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    } // 이렇게 정리해주면 좋네
    
    private let chatList = ChatModel.dummy()
}

extension ChatViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension ChatViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    } //필수1
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        cell.dataBind(chatList[indexPath.row])
        
        return cell
    } //필수2
    // dequeueReusanbleCell(tableView 내장 함수 / identifier, indexPath 가 이거인 셀을 재사용 큐에서 뽑아 쓰자 + ChatTableViewCell 의 형태
    //UITableViewCell() -> 아무것도 없는 기본 셀!
    
    
}
