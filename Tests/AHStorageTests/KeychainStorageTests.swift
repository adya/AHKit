import XCTest
@testable import AHStorage

class KeychainStorageTests: TypedStorageTests {

    private let keychainStorage = KeychainStorage()
    
    override var storage: AnyTypedStorage { keychainStorage }
}
