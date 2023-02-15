//
//  SecondScreen.swift
//  readAR
//
//  Created by Zidan Ramadhan on 24/01/23.
//

import UIKit
import SceneKit
import ARKit

class ARViewController: UIViewController, ARSCNViewDelegate {

    //MARK: - UI
    lazy var sceneView: ARSCNView = {
        let sceneView = ARSCNView()
        return sceneView
    }()
    
    //Footer
    lazy var footerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 390, height: 160))
        view.backgroundColor = UIColor(named: "Blue")
        view.roundCorners([.topLeft, .topRight], radius: 20)
        view.layer.shadowColor = UIColor(named: "LightGrey")?.cgColor
        view.layer.shadowOpacity = 0.7
        view.layer.shadowRadius = 6
        view.layer.shadowOffset = CGSize(width: 1, height: 2)
        return view
    }()
    lazy var interactionLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 111, height: 34))
        label.textAlignment = .left
        label.font = UIFont.SFProDisplay(.semibold, size: 30)
        label.textColor = UIColor(named: "LightGrey")
        label.text = "Pilih Interaksimu"
        return label
    }()
    lazy var segmentedControl: UISegmentedControl = {
        let items = ["Object 3D", "Video"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.frame = CGRect(x: 0, y: 0, width: 250, height: 50)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = UIColor(named: "Grey")
        segmentedControl.selectedSegmentTintColor = UIColor(named: "Cream")
        segmentedControl.addTarget(self, action: #selector(segmentedAction), for: .valueChanged)

        return segmentedControl
    }()
    
    //MARK: - Program
    enum InteractionMode: Int {
        case object3D
        case video
    }

    var currentMode: InteractionMode = .object3D
    var videoNode = SKVideoNode(fileNamed: "")
    
    @objc func segmentedAction(_ segmentedControl: UISegmentedControl) {
        currentMode = InteractionMode(rawValue: segmentedControl.selectedSegmentIndex)!
        sceneView.setNeedsDisplay()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()

        if let imageAnchor = anchor as? ARImageAnchor {
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            let planeNode = SCNNode(geometry: plane)
            planeNode.eulerAngles.x = -.pi / 2
            
            switch currentMode {
            case .object3D:
                plane.firstMaterial?.diffuse.contents = UIColor(white: 1.0, alpha: 0.5)
                node.addChildNode(planeNode)
                
                if imageAnchor.referenceImage.name == "News1" {
                    if let newsScene = SCNScene(named: "art.scnassets/oddish.scn") {
                        if let newsNode = newsScene.rootNode.childNodes.first {
                            newsNode.eulerAngles.x = .pi / 2
                            planeNode.addChildNode(newsNode)
                            
                        }
                    }
                }
                
            case .video:
                let videoScene = SKScene(size: CGSize(width: 1280, height: 720))
              
                
                if imageAnchor.referenceImage.name == "News1" {
                    videoNode = SKVideoNode(fileNamed: "erickThohir.mp4")
                } else if imageAnchor.referenceImage.name == "News2" {
                    videoNode = SKVideoNode(fileNamed: "missUniverse.mp4")
                }
                
                videoNode.position = CGPoint(x: videoScene.size.width / 2, y: videoScene.size.height / 2)
                videoNode.yScale = -1.0
                videoScene.addChild(videoNode)
                plane.firstMaterial?.diffuse.contents = videoScene
                node.addChildNode(planeNode)
                node.updateFocusIfNeeded()
                
            }
        }

        return node
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let imageAnchor = anchor as? ARImageAnchor else {return}
        if imageAnchor.isTracked {
            videoNode.play()
        } else {
            videoNode.pause()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(sceneView)
        
        //Set Scene View Constraint
        NSLayoutConstraint.activate([
            sceneView.topAnchor.constraint(equalTo: view.topAnchor),
            sceneView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sceneView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sceneView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        view.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        sceneView.delegate = self
        sceneView.autoenablesDefaultLighting = true
        
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        if let imageToTrack = ARReferenceImage.referenceImages(inGroupNamed: "Newspaper", bundle: Bundle.main) {
            configuration.detectionImages = imageToTrack
            configuration.maximumNumberOfTrackedImages = 2
            print("Images Successfully Added")
            
        }
        // Run the view's session
        sceneView.session.run(configuration)

        
        setupViews()
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    //MARK: - Setup UI
    func setupViews() {
        sceneView.addSubview(footerView)
        footerView.addSubview(interactionLabel)
        footerView.addSubview(segmentedControl)
        
        //Constraints
        footerView.snp.makeConstraints { make in
            make.bottom.equalTo(0)
            make.left.right.equalTo(0)
            make.height.equalTo(160)
        }
        interactionLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(15)
            make.centerX.equalTo(self.view)
        }
        segmentedControl.snp.makeConstraints { make in
            make.topMargin.equalTo(65)
            make.width.equalTo(358)
            make.centerX.equalTo(self.view)
        }
        
    }
    
}
