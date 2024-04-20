//
//  UIScrollViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 이수민 on 4/6/24.
//

import UIKit
import SnapKit

class UIScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        // Do any additional setup after loading the view.
    }

    private let scrollView = UIScrollView()
    private var contentView = UIView()

    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [redView, orangeView, yellowView, greenView, blueView, purpleView].forEach {
            contentView.addSubview($0)
        }

        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.greaterThanOrEqualToSuperview().priority(.low)
            // contentView의 height가 scrollView의 height보다 크거나 같도록 설정합니다. 우선순위는 낮습니다.
        }
        
        redView.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView)
            make.height.equalTo(337)
            make.width.equalTo(contentView).dividedBy(2)
        }
        
        orangeView.snp.makeConstraints { make in
            make.top.bottom.equalTo(redView)
            make.leading.equalTo(redView.snp.trailing)
            make.trailing.equalTo(contentView)
        }
        
        yellowView.snp.makeConstraints { make in
            make.top.equalTo(redView.snp.bottom)
            make.leading.equalTo(contentView)
            make.height.width.equalTo(redView)
        }
        
        greenView.snp.makeConstraints { make in
            make.top.bottom.equalTo(yellowView)
            make.leading.equalTo(redView.snp.trailing)
            make.trailing.equalTo(contentView)
        }
        
        blueView.snp.makeConstraints { make in
            make.top.equalTo(yellowView.snp.bottom)
            make.leading.equalTo(contentView)
            make.height.width.equalTo(redView)
        }
        
        purpleView.snp.makeConstraints { make in
            make.top.bottom.equalTo(blueView)
            make.leading.equalTo(redView.snp.trailing)
            make.trailing.equalTo(contentView)
        }
        
    }
    
    private var redView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 235/255, green: 8/255, blue: 8/255, alpha: 1)
        return view
    }()
    
    private var orangeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 255/255, green: 126/255, blue: 54/255, alpha: 1)
        return view
    }()
    
    private var yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 0, alpha: 1)
        return view
    }()
    
    private var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 128/255, blue: 0, alpha: 1)
        return view
    }()
    
    private var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 255/255, alpha: 1)
        return view
    }()
    
    private var purpleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 128/255, green: 0, blue: 128/255, alpha: 1)
        return view
    }()
    
}
