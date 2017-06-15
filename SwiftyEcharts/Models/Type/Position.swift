//
//  Position.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 15/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 位置
///
/// - auto: 自动
/// - left: 水平：左
/// - center: 水平：中间
/// - right: 水平：右
/// - top: 垂直：顶部
/// - middle: 垂直：中间
/// - bottom: 垂直：底部
/// - value: 绝对位置
/// - percent: 相对位置
public enum Position: Jsonable {
    case auto, left, center, right, top, middle, bottom, start, end, inside, inner, outside, insideLeft, insideTop, insideRight, insideBottom, insideTopLeft, insideBottomLeft, insideTopRight, insideBottomRight
    case value(LengthValue)
    case point(Point)
    
    public var jsonString: String {
        switch self {
        case .auto:
            return "auto".jsonString
        case .left:
            return "left".jsonString
        case .right:
            return "right".jsonString
        case .center:
            return "center".jsonString
        case .top:
            return "top".jsonString
        case .bottom:
            return "bottom".jsonString
        case .middle:
            return "middle".jsonString
        case .start:
            return "start".jsonString
        case .end:
            return "end".jsonString
        case .inside:
            return "inside".jsonString
        case .inner:
            return "inner".jsonString
        case .outside:
            return "outside".jsonString
        case .insideLeft:
            return "insideLeft".jsonString
        case .insideRight:
            return "insideRight".jsonString
        case .insideTop:
            return "insideTop".jsonString
        case .insideBottom:
            return "insideBottom".jsonString
        case .insideTopLeft:
            return "insideTopLeft".jsonString
        case .insideBottomLeft:
            return "insideBottomLeft".jsonString
        case .insideTopRight:
            return "insideTopRight".jsonString
        case .insideBottomRight:
            return "insideBottomRight".jsonString
        case let .point(point):
            return point.jsonString
        case let .value(val):
            return val.jsonString
        }
    }
}

public enum Location: String, Jsonable {
    case start = "start"
    case middle = "middle"
    case end = "end"
    
    public var jsonString: String {
        return self.rawValue.jsonString
    }
}
