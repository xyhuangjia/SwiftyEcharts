//
//  SECTextStyle.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 30/11/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//

import UIKit



/// 水平对齐
///
/// - left: 左边
/// - right: 右边
/// - center: 中间
public enum SECAlign: String {
    case left = "left"
    case right = "right"
    case center = "center"
    case auto = "auto"
    case none = ""
}

/// 文本垂直对齐
///
/// - top: 顶部
/// - middle: 中间
/// - bottom: 底部
public enum SECTextBaseline: String {
    case top = "top"
    case middle = "middle"
    case bottom = "bottom"
}

/// 文字样式
public struct SECTextStyle: SECColorful {
    /// 颜色
    public var color: SECColor?
    /// 文字字体的风格
    public var fontStyle: SECFontStyle?
    /// 文字字体的粗细
    public var fontWeight: SECFontWeight?
    /// 文字的字体系列
    public var fontFamily: String?
    /// 文字的字体大小
    public var fontSize: UInt?
    
}

public protocol SECTextful {
    var textStyle: SECTextStyle? { get set }
}