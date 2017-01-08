//
//  SECJsonable.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 04/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol SECJsonable{
    var jsonString: String { get }
}

public extension SECJsonable {
    var jsonString: String {
        return "\(self)"
    }
    
    internal func toJson() -> String {
        return self.jsonString
    }
}

extension Bool: SECJsonable {}
extension Int: SECJsonable {}
extension Int8: SECJsonable {}
extension Int16: SECJsonable {}
extension Int32: SECJsonable {}
extension Int64: SECJsonable {}
extension UInt: SECJsonable {}
extension UInt8: SECJsonable {}
extension UInt16: SECJsonable {}
extension UInt32: SECJsonable {}
extension UInt64: SECJsonable {}
extension Double: SECJsonable {}
extension Float: SECJsonable {}

extension String: SECJsonable {
    public var jsonString: String {
        return "\"\(self)\""
    }
}

extension Optional: SECJsonable {
    public var jsonString: String {
        switch self {
        case .None:
            return "null"
        case let .Some(value):
            if value is SECJsonable {
                return (value as! SECJsonable).toJson()
            } else {
                return "\(value)"
            }
        }
    }
}

extension Array: SECJsonable {
    public var jsonString: String {
        var jsonStr = "[\n"
        for item in self {
            if let i = item as? SECJsonable {
                jsonStr += "\(i.toJson())"
            } else {
                jsonStr += "\(item)"
            }
            jsonStr += ",\n"
        }
        jsonStr = jsonStr.substringToIndex(jsonStr.endIndex.predecessor().predecessor())
        jsonStr += "\n]"
        return jsonStr
    }
}

extension Dictionary: SECJsonable {
    public var jsonString: String {
        var jsonStr = "{\n"
        
        let sortedKeys = Array(self.keys).sort { String($0) < String($1) }

        for key in sortedKeys {
            let value = self[key]!
            jsonStr += "\"\(key)\":"
            if let v = value as? SECJsonable {
                jsonStr += "\(v.toJson())"
            } else {
                jsonStr += "\(value)"
            }
            jsonStr += ",\n"
        }
        
        jsonStr = jsonStr.substringToIndex(jsonStr.endIndex.predecessor().predecessor())
        jsonStr += "\n}"
        return jsonStr
    }
}

