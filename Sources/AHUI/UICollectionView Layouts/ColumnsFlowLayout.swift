// - Since: 01/20/2018
// - Author: Arkadii Hlushchevskyi
// - Copyright: © 2022. Arkadii Hlushchevskyi.
// - Seealso: https://github.com/adya/TSKit.UI/blob/master/LICENSE.md
#if os(iOS)
import UIKit

/// Adjusts cells size to fit specified number of columns.
@IBDesignable
class ColumnsFlowLayout: UICollectionViewFlowLayout {

    @IBInspectable
    var cellsPerRow: Int = 1 {
        didSet {
            invalidateLayout()
        }
    }

    @IBInspectable
    var isFixedHeight: Bool = false {
        didSet {
            invalidateLayout()
        }
    }

    override var itemSize: CGSize {
        get {
            guard let collectionView = collectionView else { return super.itemSize }
            let marginsAndInsets =
            collectionView.adjustedContentInset.left +
            collectionView.adjustedContentInset.right +
            sectionInset.left +
            sectionInset.right +
            minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
            let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
            let defaultSize = super.itemSize
            let height: CGFloat
            if isFixedHeight {
                height = defaultSize.height
            } else {
                let ratio = defaultSize.width / defaultSize.height
                height = itemWidth / ratio
            }
            return CGSize(width: itemWidth, height: height)
        }
        set {
            super.itemSize = newValue
        }
    }

    init(cellsPerRow: Int,
         minimumInteritemSpacing: CGFloat = 0,
         minimumLineSpacing: CGFloat = 0,
         sectionInset: UIEdgeInsets = .zero) {
        self.cellsPerRow = cellsPerRow
        super.init()

        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.minimumLineSpacing = minimumLineSpacing
        self.sectionInset = sectionInset
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        cellsPerRow = aDecoder.decodeInteger(forKey: "cellPerRow")
        isFixedHeight = aDecoder.decodeBool(forKey: "isFixedHeight")
    }

    override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
        let context = super.invalidationContext(forBoundsChange: newBounds) as! UICollectionViewFlowLayoutInvalidationContext
        context.invalidateFlowLayoutDelegateMetrics = newBounds != collectionView?.bounds
        return context
    }
}
#endif
