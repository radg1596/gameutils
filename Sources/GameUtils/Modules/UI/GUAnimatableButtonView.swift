//
//  GUAnimatableButtonView.swift
//  
//
//  Created by Ricardo Desiderio on 19/02/21.
//

#if !os(macOS)
import UIKit

public class GUAnimatableButtonView: UIView {

    // MARK: PROPERTIES
    private var longGesture = UILongPressGestureRecognizer()
    private var completion: ( () -> () )? = nil

    // MARK: VIEW CYCLE LIFE
    public override func didMoveToWindow() {
        super.didMoveToWindow()
        addLongGestureToView()
    }

    // MARK: EXPOSED METHODS
    public func addAction(completion: ( () -> Void )?) {
        self.completion = completion
    }

    // MARK: CUSTOM PRIVATE
    private func addLongGestureToView() {
        longGesture.minimumPressDuration = 0
        longGesture.addTarget(self, action: #selector(handleGesture(sender:)))
        addGestureRecognizer(longGesture)
    }

    @objc private func handleGesture(sender: UILongPressGestureRecognizer) {
        switch sender.state {
        case .began:
            UIView.animate(withDuration: 0.25) { [weak self] in
                self?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                self?.alpha = 0.85
            }
        case .ended, .failed, .possible:
            UIView.animate(withDuration: 0.25, animations: { [weak self] in
                self?.transform = CGAffineTransform.identity
                self?.alpha = 1
            }) {  [weak self] _ in
                guard let self = self else {return}
                DispatchQueue.main.async {
                    self.completion?()
                }
            }
        default:
            break
        }
    }

}

#else
#endif
