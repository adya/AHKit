// - Since: 01/20/2018
// - Author: Arkadii Hlushchevskyi
// - Copyright: © 2022. Arkadii Hlushchevskyi.
// - Seealso: https://github.com/adya/TSKit.UI/blob/master/LICENSE.md
#if os(iOS)
import UIKit

/// Adjusts cells size to fit specified number of columns.
@IBDesignable
class AdaptiveFlowLayout: UICollectionViewFlowLayout {

    @IBInspectable
    var minimumItemSize: CGSize = .init(width: 100, height: 100)

    init(minimumItemSize: CGSize,
         minimumInteritemSpacing: CGFloat = 0,
         minimumLineSpacing: CGFloat = 0,
         sectionInset: UIEdgeInsets = .zero) {
        self.minimumItemSize = minimumItemSize
        super.init()

        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.minimumLineSpacing = minimumLineSpacing
        self.sectionInset = sectionInset
        self.itemSize = calculateItemSize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let size = aDecoder.decodeCGSize(forKey: "minimumItemSize")
        if size.width > 0 && size.height > 0 {
            minimumItemSize = size
        }
        self.itemSize = calculateItemSize()
    }

    override func invalidateLayout() {
        itemSize = calculateItemSize()
        super.invalidateLayout()
    }

    override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
        let context = super.invalidationContext(forBoundsChange: newBounds) as! UICollectionViewFlowLayoutInvalidationContext
        context.invalidateFlowLayoutDelegateMetrics = newBounds != collectionView?.bounds
        return context
    }

    private func calculateItemSize() -> CGSize {
        guard let collectionView = collectionView else { return super.itemSize }
        let insets =
        collectionView.adjustedContentInset.left +
        collectionView.adjustedContentInset.right +
        sectionInset.left +
        sectionInset.right

        let contentWidth = collectionView.bounds.size.width - insets

        let minCellWidth = minimumItemSize.width
        let minCellHeight = minimumItemSize.height

        var cellCount = floor(contentWidth / (minCellWidth + minimumInteritemSpacing))
        cellCount = cellCount <= 0 ? 1 : cellCount

        let totalInterItemSpacing = CGFloat(cellCount - 1) * minimumInteritemSpacing
        let realCellWidth = floor((contentWidth - totalInterItemSpacing) / cellCount)
        return CGSize(width: realCellWidth, height: minCellHeight)
    }
}
#endif
