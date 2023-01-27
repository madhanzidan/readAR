//
//  ViewController.swift
//  readAR
//
//  Created by Zidan Ramadhan on 24/01/23.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    //MARK: - Header
    lazy var headerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 390, height: 172))
        view.backgroundColor = UIColor(named: "Blue")
        return view
    }()
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: headerView.frame.width - 20, height: 100))
        label.textAlignment = .left
        label.font = UIFont.SFProDisplay(.heavy, size: 34)
        label.textColor = UIColor(named: "LightGrey")
        label.text = "Hai, ayo mulai\npengalaman AR-mu!"
        label.numberOfLines = 2
        return label
    }()
    
    //MARK: - Main Menu
    lazy var infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.setImage(UIImage(named: "Info"), for: .normal)
        button.tintColor = UIColor(named: "Blue")
        button.addTarget(self, action: #selector(infoPressed), for: .touchUpInside)
        return button
    }()
    //Start Button
    lazy var startButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 285, height: 251)
        button.setImage(UIImage(named: "StartButton"), for: .normal)
        //Button action
        button.addTarget(self, action: #selector(startPressed), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Cream")
        title = ""
        navigationController?.navigationBar.prefersLargeTitles = true
        setupViews()
    }
    
    
    @objc func startPressed() {
        let nextScreen = ARViewController()
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    @objc func infoPressed() {
        let navigationVC = UINavigationController(rootViewController: InfoViewController())
        present(navigationVC, animated: true)
    }
    
    func setupViews() {
        self.view.addSubview(headerView)
        headerView.addSubview(welcomeLabel)
        self.view.addSubview(infoButton)
        self.view.addSubview(startButton)
        
        //Constraints
        headerView.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(172)
        }
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(65)
            make.leftMargin.equalTo(20)
        }
        infoButton.snp.makeConstraints { make in
            make.topMargin.equalTo(55)
            make.right.equalTo(-20)
            make.height.equalTo(35)
            make.width.equalTo(35)
        }
        startButton.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.topMargin.equalTo(200)
            make.height.equalTo(251)
            make.width.equalTo(285)
        }
       
        
    }
}

