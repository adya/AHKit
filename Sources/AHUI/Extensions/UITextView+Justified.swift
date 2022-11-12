// - Since: 11/28/2021
// - Author: Arkadii Hlushchevskyi
// - Copyright: © 2022. Arkadii Hlushchevskyi.
// - Seealso: https://github.com/adya/TSKit.UI/blob/master/LICENSE.md
#if os(iOS)
import UIKit

extension UITextView {
    
    func setJustifiedAttributedText(_ text: NSAttributedString) {
        let justifiedStrng = NSMutableAttributedString(attributedString: text)
        let style = NSMutableParagraphStyle()
        style.alignment = .justified
        style.hyphenationFactor = 1
        justifiedStrng.addAttribute(.paragraphStyle,
                             value: style,
                             range: .init(location: 0, length: justifiedStrng.length))
        attributedText = justifiedStrng
    }
}
#endif
