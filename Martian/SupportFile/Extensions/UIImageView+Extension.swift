import UIKit
import Kingfisher

extension UIImageView{

    var kingfisherOptions: KingfisherOptionsInfo
        {
            let processor = ResizingImageProcessor(referenceSize: self.frame.size, mode: .aspectFill)
            let options: KingfisherOptionsInfo = [.scaleFactor(UIScreen.main.scale), .transition(.fade(1)), .processor(processor), .cacheOriginalImage]
            return options
        }
}
