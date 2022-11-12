import XCTest
@testable import AHStorage

class UserDefaultsStorageTests: TypedStorageTests {

    private let userDefaultsStorage = UserDefaultsStorage()
    
    override var storage: AnyTypedStorage { userDefaultsStorage }
}
