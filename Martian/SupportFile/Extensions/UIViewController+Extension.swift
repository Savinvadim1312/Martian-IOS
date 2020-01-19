import UIKit

extension UIViewController {
    var isPortrait: Bool {
        let orientation = UIDevice.current.orientation
        switch orientation {
        case .portrait, .portraitUpsideDown:
            return true
        case .landscapeLeft, .landscapeRight:
            return false
        default: // unknown or faceUp or faceDown
            guard let window = self.view.window else { return false }
            return window.frame.size.width < window.frame.size.height
        }
    }
}
