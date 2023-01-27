//
//  InfoViewController.swift
//  readAR
//
//  Created by Zidan Ramadhan on 25/01/23.
//

import UIKit
import SnapKit

class InfoViewController: UIViewController {

    //MARK: - Header
    lazy var helpTitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 111, height: 34))
        label.textAlignment = .left
        label.font = UIFont.SFProDisplay(.semibold, size: 30)
        label.textColor = UIColor(named: "Blue")
        label.text = "Bantuan"
        return label
    }()
    lazy var closeButton = UIButton()
    
    //MARK: - Center
    lazy var startTitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 58, height: 26))
        label.textAlignment = .left
        label.font = UIFont.SFProDisplay(.semibold, size: 23)
        label.textColor = UIColor(named: "Blue")
        label.text = "Mulai"
        return label
    }()
    lazy var startDescLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 344, height: 48))
        label.textAlignment = .left
        label.font = UIFont.SFProDisplay(.light, size: 19)
        label.textColor = UIColor(named: "Blue")
        label.text = "Tekan tombol “Mulai” di menu utama untuk memulai pengalaman augmented reality"
        label.numberOfLines = 0
        return label
    }()
    lazy var objectTitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 58, height: 26))
        label.textAlignment = .left
        label.font = UIFont.SFProDisplay(.semibold, size: 23)
        label.textColor = UIColor(named: "Blue")
        label.text = "Interaksi Objek 3D"
        return label
    }()
    lazy var objectDescLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 344, height: 96))
        label.textAlignment = .left
        label.font = UIFont.SFProDisplay(.light, size: 19)
        label.textColor = UIColor(named: "Blue")
        label.text = "Pada saat memasuki tampilan kamera, pilih interaksi “Objek 3D” untuk menampilkan objek tiga dimensi di atas gambar yang\nterdeteksi"
        label.numberOfLines = 0
        return label
    }()
    lazy var videoTitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 58, height: 26))
        label.textAlignment = .left
        label.font = UIFont.SFProDisplay(.semibold, size: 23)
        label.textColor = UIColor(named: "Blue")
        label.text = "Interaksi Video"
        return label
    }()
    lazy var videoDescLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 344, height: 96))
        label.textAlignment = .left
        label.font = UIFont.SFProDisplay(.light, size: 19)
        label.textColor = UIColor(named: "Blue")
        label.text = "Pada saat memasuki tampilan kamera, pilih interaksi “Video” untuk menampilkan objek tiga dimensi di atas gambar yang terdeteksi"
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Cream")
        
        //Set Close Button
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 24, weight: .bold, scale: .large)
        let largeBoldDoc = UIImage(systemName: "xmark.circle.fill", withConfiguration: largeConfig)
        closeButton.setImage(largeBoldDoc, for: .normal)
        closeButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        closeButton.addTarget(self, action: #selector(closePressed), for: .touchUpInside)
        closeButton.tintColor = UIColor(named: "Blue")
        let closeIcon = UIBarButtonItem(customView: closeButton)
        self.navigationItem.setRightBarButtonItems([closeIcon], animated: true)
        
        setupViews()
    }
    
    @objc func closePressed() {
        self.dismiss(animated: true)
    }
    
    func setupViews() {
        self.view.addSubview(helpTitleLabel)
        self.view.addSubview(startTitleLabel)
        self.view.addSubview(startDescLabel)
        self.view.addSubview(objectTitleLabel)
        self.view.addSubview(objectDescLabel)
        self.view.addSubview(videoTitleLabel)
        self.view.addSubview(videoDescLabel)
        
        //Constraints
        helpTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(55)
            make.centerX.equalTo(self.view)
        }
        startTitleLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(75)
            make.left.equalTo(25)
            make.centerX.equalTo(self.view)
        }
        startDescLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(105)
            make.left.equalTo(25)
            make.width.equalTo(350)
            make.centerX.equalTo(self.view)
        }
        objectTitleLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(170)
            make.left.equalTo(25)
            make.centerX.equalTo(self.view)
        }
        objectDescLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(200)
            make.left.equalTo(25)
            make.width.equalTo(350)
            make.centerX.equalTo(self.view)
        }
        videoTitleLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(310)
            make.left.equalTo(25)
            make.centerX.equalTo(self.view)
        }
        videoDescLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(340)
            make.left.equalTo(25)
            make.width.equalTo(350)
            make.centerX.equalTo(self.view)
        }
    }
}
