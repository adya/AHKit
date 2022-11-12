// - Since: 11/28/2021
// - Author: Arkadii Hlushchevskyi
// - Copyright: © 2022. Arkadii Hlushchevskyi.
// - Seealso: https://github.com/adya/TSKit.UI/blob/master/LICENSE.md
#if os(iOS)
import UIKit

/// Adds unwinding capabilities to any controller that conforms to `AnyUnwindableController`.
/// - Important: Ensure that corresponding controller that you want to make "unwindable"
///              has configured `unwindSegue` with `"segUnwind"` identifier.
protocol AnyUnwindableController: AnyObject {}

extension AnyUnwindableController where Self: UIViewController {
    
    /// Unwinds current controller using configured `unwindSegue` with "segUnwind" identiifer.
    func unwind() {
        performSegue(withIdentifier: "segUnwind", sender: self)
    }
}
#endif
