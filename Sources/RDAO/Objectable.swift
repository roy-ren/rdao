//
//  Objectable.swift
//  
//
//  Created by roy on 2021/7/5.
//

import Foundation
import RealmSwift
import Realm

public protocol Objectable: Codable {
    
}

func test() {
//    let configuration = realm_config_new()
//    let path = "/document/realm"
    
}





















final class ObjectableDecoder: Decoder {
	var codingPath: [CodingKey] = []

	var userInfo: [CodingUserInfoKey : Any] = [:]

	static func types<T: Objectable>(of type: T.Type) {
		let decoder = ObjectableDecoder()
		_ = try? type.init(from: decoder)
	}

	func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key: CodingKey {
		return KeyedDecodingContainer(DecodableContainer<Key>())
	}

	func unkeyedContainer() throws -> UnkeyedDecodingContainer {
		fatalError("error")
	}

	func singleValueContainer() throws -> SingleValueDecodingContainer {
		fatalError("error")
	}
}

private final class DecodableContainer<Key: CodingKey>: KeyedDecodingContainerProtocol {
	var codingPath: [CodingKey] = []

	var allKeys: [Key] = []

	func contains(_ key: Key) -> Bool {
		true
	}

	func decodeNil(forKey key: Key) throws -> Bool {
		print("decodeNil \(key.stringValue) Bool")
		return false
	}

	func decode(_ type: Bool.Type, forKey key: Key) throws -> Bool {
		print("decode \(key.stringValue) Bool")
		return false
	}

	func decode(_ type: String.Type, forKey key: Key) throws -> String {
        print("decode \(key.stringValue) String")

		return ""
	}
    
	func decode(_ type: Double.Type, forKey key: Key) throws -> Double {
		print("decode \(key.stringValue) Double")
		return 0
	}

	func decode(_ type: Float.Type, forKey key: Key) throws -> Float {
		print("decode \(key.stringValue) Float")
		return 0
	}

	func decode(_ type: Int.Type, forKey key: Key) throws -> Int {
		print("decode \(key.stringValue) Int")
		return 0
	}

	func decode(_ type: Int8.Type, forKey key: Key) throws -> Int8 {
		print("decode \(key.stringValue) Int8")
		return 0
	}

	func decode(_ type: Int16.Type, forKey key: Key) throws -> Int16 {
		print("decode \(key.stringValue) Int16")
		return 0
	}

	func decode(_ type: Int32.Type, forKey key: Key) throws -> Int32 {
		print("decode \(key.stringValue) Int32")
		return 0
	}

	func decode(_ type: Int64.Type, forKey key: Key) throws -> Int64 {
		print("decode \(key.stringValue) Int64")
		return 0
	}

	func decode(_ type: UInt.Type, forKey key: Key) throws -> UInt {
		print("decode \(key.stringValue) UInt")
		return 0
	}

	func decode(_ type: UInt8.Type, forKey key: Key) throws -> UInt8 {
		print("decode \(key.stringValue) UInt8")
		return 0
	}

	func decode(_ type: UInt16.Type, forKey key: Key) throws -> UInt16 {
		print("decode \(key.stringValue) UInt16")
		return 0
	}

	func decode(_ type: UInt32.Type, forKey key: Key) throws -> UInt32 {
		print("decode \(key.stringValue) UInt32")
		return 0
	}

	func decode(_ type: UInt64.Type, forKey key: Key) throws -> UInt64 {
		print("decode \(key.stringValue) UInt64")
		return 0
	}

	private struct SizedPointer {
		private let pointer: UnsafeMutableRawPointer
		private let size: Int
		init<T>(of type: T.Type = T.self) {
			size = MemoryLayout<T>.size
			pointer = UnsafeMutableRawPointer.allocate(byteCount: size, alignment: 1)
			memset(pointer, 0, size)
		}
		func deallocate() {
			pointer.deallocate()
		}
		func getPointee<T>(of type: T.Type = T.self) -> T {
			return pointer.assumingMemoryBound(to: type).pointee
		}
	}

	private var sizedPointers: ContiguousArray<SizedPointer> = []

	func decode<T>(_ type: T.Type, forKey key: Key) throws -> T where T : Decodable {
		print("decode \(key.stringValue) T")
		let sizedPointer = SizedPointer(of: T.self)
		sizedPointers.append(sizedPointer)
		return sizedPointer.getPointee()
	}

	func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type, forKey key: Key) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
		fatalError("error")
	}

	func nestedUnkeyedContainer(forKey key: Key) throws -> UnkeyedDecodingContainer {
		fatalError("error")
	}

	func superDecoder() throws -> Decoder {
		fatalError("error")
	}

	func superDecoder(forKey key: Key) throws -> Decoder {
		fatalError("error")
	}
}
