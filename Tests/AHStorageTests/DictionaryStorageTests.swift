import XCTest
@testable import AHStorage

class DictionaryTypedStorageTests: TypedStorageTests {

    private let dictionaryStorage = DictionaryStorage()
    
    override var storage: AnyTypedStorage { dictionaryStorage }
}
