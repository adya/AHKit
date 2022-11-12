import XCTest
@testable import AHStorage

class UbiquitousStorageTests: TypedStorageTests {

    private let ubiquitousStorage = UbiquitousStorage()
    
    override var storage: AnyTypedStorage { ubiquitousStorage }
}
