//
//  GUSpriteKiMockViewController.swift
//  
//
//  Created by Ricardo Desiderio on 20/03/21.
//

#if !os(macOS)
import UIKit
import SpriteKit

public class GUSpriteKitViewControllerMock: UIViewController {

    // MARK: - OUTLETS
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var informationView: UIView!

    // MARK: - PROPERTIES
    /// The current scene of the view controller
    public var skScene: SKScene? {
        guard let skView: SKView = view as? SKView else { return nil }
        return skView.scene
    }

    // MARK: - VIEW CYCLE LIFE
    public override func viewDidLoad() {
        super.viewDidLoad()
        addScene()
        configureUI()
    }

    // MARK: - UI
    private func configureUI() {
        informationView.layer.masksToBounds = false
        informationView.layer.cornerRadius = 10.0
    }

    // MARK: - EXPOSED METHODS
    /// Creates an instance of the view controller
    public static func instantiate() -> GUSpriteKitViewControllerMock? {
        let identifier: String = "GUSpriteKitViewControllerMock"
        let storyboard: UIStoryboard = UIStoryboard(name: identifier,
                                                    bundle: .module)
        return storyboard.instantiateViewController(withIdentifier: identifier) as? GUSpriteKitViewControllerMock
    }

    /// Adds a new `SKScene` on the test view of the controller
    /// - Parameter scene: The scene desired to content the controller
    public func addScene(scene: SKScene) {
        if let view: SKView = view as? SKView {
            informationLabel.text = "Testing some SKScene"
            view.presentScene(scene)
        }
    }

    // MARK: - PRIVATE METHODS
    /// Adds a game scene for test purpouses
    private func addScene() {
        if let view: SKView = view as? SKView {
            let skScene: SKScene = SKScene()
            informationLabel.text = "Testing some SKScene"
            view.presentScene(skScene)
        }
    }

}

#else
#endif
