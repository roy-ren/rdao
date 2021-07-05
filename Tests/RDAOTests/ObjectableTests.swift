import XCTest
@testable import RDAO
import UniformTypeIdentifiers

final class ObjectableTests: XCTestCase {
    func test_property() throws {

		let decoder = ObjectableDecoder()
		if let element = try? MokeElement.init(from: decoder) {
			print(element)
		}
    }
}

extension ObjectableTests {
	struct MokeElement: Objectable {

//		let string: String
		let int: Int
		let int8: Int8
		let int16: Int16
		let int32: Int32
		let int64: Int64
//		let uint: UInt
		let uint8: UInt8
		let uint16: UInt16
		let uint32: UInt32
		let uint64: UInt64
		let bool: Bool
//		let optionnal: String?
		let persion: Persion
	}

	struct Persion: Codable {
		let name: String
		let age: UInt
		let gender: Gender
	}

	enum Gender: Codable {
		case male
		case female
	}
}
