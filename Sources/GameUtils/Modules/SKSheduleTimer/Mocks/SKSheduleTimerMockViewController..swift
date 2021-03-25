//
//  File.swift
//  
//
//  Created by Ricardo Desiderio on 20/03/21.
//

#if !os(macOS)
import UIKit
import SpriteKit

class SKSheduleTimerMockViewController: UIViewController {

    // MARK: - PROPERTIES
    /// The current scene of the view controller
    var skScene: SKScene? {
        guard let skView: SKView = view as? SKView else { return nil }
        return skView.scene
    }

    // MARK: - VIEW CYCLE LIFE
    override func viewDidLoad() {
        super.viewDidLoad()
        addScene()
    }

    // MARK: - EXPOSED METHODS
    /// Creates an instance of the view controller
    static func instantiate() -> SKSheduleTimerMockViewController? {
        let identifier: String = "SKSheduleTimerMockViewController"
        let storyboard: UIStoryboard = UIStoryboard(name: identifier,
                                                    bundle: .module)
        return storyboard.instantiateViewController(withIdentifier: identifier) as? SKSheduleTimerMockViewController
    }

    // MARK: - PRIVATE METHODS
    /// Adds a game scene for test purpouses
    private func addScene() {
        if let view: SKView = view as? SKView {
            let skScene: SKScene = SKScene()
            view.presentScene(skScene)
        }
    }

}

#else
#endif
