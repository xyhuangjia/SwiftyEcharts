//
//  SECPieOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public struct SECPieOptions {
    // MARK: Customized Pie
    /// 地址:http://echarts.baidu.com/demo.html#pie-custom
    static func pieCustomOption() -> SECOption {
        return SECOption(
            .backgroundColor(.hexColor("#2c343c")),
            .title(SECTitle(
                .text("Customized Pie"),
                .left(.center),
                .top(.value(20)),
                .textStyle(SECTextStyle(
                    .color(.hexColor("#ccc"))
                    ))
                )),
            .tooltip(SECTooltip(
                .trigger(.item),
                .formatter(.string("{a} <br/>{b} : {c} ({d}%)"))
                )),
            .visualMap(SECContinuousVisualMap(
                .show(false),
                .min(80),
                .max(600),
                .inRange([
                    "colorLightness" : [0, 1]
                    ])
                )),
            .series([
                SECPieSerie(
                    .name("访问来源"),
                    .radius(55%),
                    .center([50%, 50%]),
                    .data([
                        ["value":235, "name":"视频广告"],
                        ["value":274, "name":"联盟广告"],
                        ["value":310, "name":"邮件营销"],
                        ["value":335, "name":"直接访问"],
                        ["value":400, "name":"搜索引擎"]
                        ]),
                    .roseType(.enable),
                    .label(SECFormattedLabel(
                        .normal(SECFormattedLabelStyle(
                            .textStyle(SECTextStyle(
                                .color(.rgba(255, 255, 255, 0.3))
                                ))
                            ))
                        )),
                    .labelLine(SECPieSerie.LabelLine(
                        .normal(SECPieSerie.LabelLineContent(
                            .lineStyle(SECLineStyle(
                                .color(.rgba(255, 255, 255, 0.3))
                                )),
//                            .smooth(0.2), // FIXME: 需要调整类型
                            .length(10),
                            .length2(20)
                            ))
                        )),
                    .itemStyle(SECItemStyle(
                        .normal(SECCommonItemStyleContent(
                            .color(.hexColor("#c23531")),
                            .shadowBlur(200),
                            .shadowColor(.rgba(0, 0, 0, 0.5))
                            ))
                        )),
                    .animationType(.scale),
                    .animationEasing(.elasticOut),
                    .animationDelay(.function("function animationDelay(idx) { return Math.random() * 200 ;} "))
                )
                ])
        )
    }
    
    // MARK: 环形图
    /// 地址: http://echarts.baidu.com/demo.html#pie-doughnut
    static func pieDoughnutOption() -> SECOption {
        return SECOption(
            .tooltip(SECTooltip(
                .trigger(.item),
                .formatter(.string("{a} <br/>{b}: {c} ({d}%)"))
                )),
            .legend(SECLegend(
                .orient(.vertical),
                .left(.auto),
                .data(["直接访问","邮件营销","联盟广告","视频广告","搜索引擎"])
                )),
            .series([
                SECPieSerie(
                    .name("访问来源"),
                    .radiusRange([50%, 70%]),
                    .avoidLabelOverlap(false),
                    .label(SECFormattedLabel(
                        .normal(SECFormattedLabelStyle(
                            .show(false),
                            .position(.center)
                            )),
                        .emphasis(SECFormattedLabelStyle(
                            .show(true),
                            .textStyle(SECTextStyle(
                                .fontSize(30),
                                .fontWeight(.bold)
                                ))
                            ))
                        )),
                    .labelLine(SECPieSerie.LabelLine(
                        .normal(SECPieSerie.LabelLineContent(
                            .show(false)
                            ))
                        )),
                    .data([
                        ["value":335,"name":"直接访问"],
                        ["value":310,"name":"邮件营销"],
                        ["value":234,"name":"联盟广告"],
                        ["value":135,"name":"视频广告"],
                        ["value":1548,"name":"搜索引擎"]
                        ])
                )
                ])
        )
    }
    
    // MARK: 嵌套环形图
    /// 地址: http://echarts.baidu.com/demo.html#pie-nest
    static func pieNestOption() -> SECOption {
        return SECOption(
            .tooltip(SECTooltip(
                .trigger(.item),
                .formatter(.string("{a} <br/>{b}: {c} ({d}%)"))
                )),
            .legend(SECLegend(
                .orient(.vertical),
                .left(.auto),
                .data(["直达","营销广告","搜索引擎","邮件营销","联盟广告","视频广告","百度","谷歌","必应","其他"])
                )),
            .series([
                SECPieSerie(
                    .name("访问来源"),
                    .selectedMode(.mode(.single)),
                    .radiusRange([0, 30%]),
                    .label(SECFormattedLabel(
                        .normal(SECFormattedLabelStyle(
                            .position(.inner)
                            ))
                        )),
                    .labelLine(SECPieSerie.LabelLine(
                        .normal(SECPieSerie.LabelLineContent(
                            .show(false)
                            ))
                        )),
                    .data([
                        ["value":335, "name":"直达", "selected":true],
                        ["value":679, "name":"营销广告"],
                        ["value":1548, "name":"搜索引擎"]
                        ])
                ),
                SECPieSerie(
                    .name("访问来源"),
                    .radiusRange([40%, 55%]),
                    .data([
                        ["value":335, "name":"直达"],
                        ["value":310, "name":"邮件营销"],
                        ["value":234, "name":"联盟广告"],
                        ["value":135, "name":"视频广告"],
                        ["value":1048, "name":"百度"],
                        ["value":251, "name":"谷歌"],
                        ["value":147, "name":"必应"],
                        ["value":102, "name":"其他"]
                        ])
                )
                ])
        )
    }
    
    // MARK: 饼图纹理
    /// 地址: http://echarts.baidu.com/demo.html#pie-pattern
    static func piePatternOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
    // MARK: 某站点用户访问来源
    /// 地址: http://echarts.baidu.com/demo.html#pie-simple
    static func pieSimpleOption() -> SECOption {
        return SECOption(
            .title(SECTitle(
                .text("某站点用户访问来源"),
                .sublink("纯属虚构"),
                .left(.center)
                )),
            .tooltip(SECTooltip(
                .trigger(.item),
                .formatter(.string("{a} <br/>{b}: {c} ({d}%)"))
                )),
            .legend(SECLegend(
                .orient(.vertical),
                .left(.auto),
                .data(["直接访问","邮件营销","联盟广告","视频广告","搜索引擎"])
                )),
            .series([
                SECPieSerie(
                    .name("访问来源"),
                    .radius(55%),
                    .center([50%, 60%]),
                    .data([
                        ["value":335,"name":"直接访问"],
                        ["value":310,"name":"邮件营销"],
                        ["value":234,"name":"联盟广告"],
                        ["value":135,"name":"视频广告"],
                        ["value":1548,"name":"搜索引擎"]
                        ]),
                    .itemStyle(SECItemStyle(
                        .emphasis(SECCommonItemStyleContent(
                            .shadowBlur(10),
                            .shadowOffsetX(0),
                            .shadowColor(.rgba(0, 0, 0, 0.5))
                            ))
                        ))
                )
                ])
        )
    }
    
    // MARK: 南丁格尔玫瑰图
    /// 地址: http://echarts.baidu.com/demo.html#pie-roseType
    static func pieRoseTypeOption() -> SECOption {
        return SECOption(
            .title(SECTitle(
                .text("南丁格尔玫瑰图"),
                .sublink("纯属虚构"),
                .left(.center)
                )),
            .tooltip(SECTooltip(
                .trigger(.item),
                .formatter(.string("{a} <br/>{b} : {c} ({d}%)"))
                )),
            .legend(SECLegend(
                .left(.center),
                .top(.bottom),
                .data(["rose1","rose2","rose3","rose4","rose5","rose6","rose7","rose8"])
                )),
            .toolbox(SECToolbox(
                .show(true),
                .feature(SECToolbox.Feature(
                    .dataView(SECTFDataView(
                        .show(true),
                        .readOnly(false)
                        )),
                    .magicType(SECTFMagicType(
                        .show(true)
                        )),
                    .restore(SECTFRestore(
                        .show(true)
                        )),
                    .saveAsImage(SECTFSaveAsImage(
                        .show(true)
                        ))
                    ))
                )),
            .series([
                SECPieSerie(
                    .name("半径模式"),
                    .radiusRange([10, 55]),
                    .center([25%, 50%]),
                    .roseType(.enable),
                    .label(SECFormattedLabel(
                        .normal(SECFormattedLabelStyle(
                            .show(false)
                            )),
                        .emphasis(SECFormattedLabelStyle(
                            .show(true)
                            ))
                        )),
                    .labelLine(SECPieSerie.LabelLine(
                        .normal(SECPieSerie.LabelLineContent(
                            .show(false)
                            )),
                        .emphasis(SECPieSerie.LabelLineContent(
                            .show(true)
                            ))
                        )),
                    .data([
                        ["value":10, "name":"rose1"],
                        ["value":5, "name":"rose2"],
                        ["value":15, "name":"rose3"],
                        ["value":25, "name":"rose4"],
                        ["value":20, "name":"rose5"],
                        ["value":35, "name":"rose6"],
                        ["value":30, "name":"rose7"],
                        ["value":40, "name":"rose8"]
                        ])
                ),
                SECPieSerie(
                    .name("面积模式"),
                    .radiusRange([15, 55]),
                    .center([75%, 50%]),
                    .roseType(.radius),
                    .data([
                        ["value":10, "name":"rose1"],
                        ["value":5, "name":"rose2"],
                        ["value":15, "name":"rose3"],
                        ["value":25, "name":"rose4"],
                        ["value":20, "name":"rose5"],
                        ["value":35, "name":"rose6"],
                        ["value":30, "name":"rose7"],
                        ["value":40, "name":"rose8"]
                        ])
                )
                ])
        )
    }
}
