//
//  PieSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 29/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class PieSerieSpec: QuickSpec {
    override func spec() {
        let showLabelLineContentValue = false
        let lengthLabelLineContentValue: Float = 7.77777
        let length2LabelLineContentValue: Float = 65.374
        let smoothLabelLineContentValue = true
        let lineStyleLabelLineContentValue = LineStyle(
            .curveness(6.485),
            .type(LineType.dashed)
        )
        
        let labelLineContent = PieSerie.LabelLineContent()
        labelLineContent.show = showLabelLineContentValue
        labelLineContent.length = lengthLabelLineContentValue
        labelLineContent.length2 = length2LabelLineContentValue
        labelLineContent.smooth = smoothLabelLineContentValue
        labelLineContent.lineStyle = lineStyleLabelLineContentValue
        
        describe("For PieSerie.LabelLineContent") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showLabelLineContentValue,
                    "length": lengthLabelLineContentValue,
                    "length2": length2LabelLineContentValue,
                    "smooth": smoothLabelLineContentValue,
                    "lineStyle": lineStyleLabelLineContentValue
                ]
                
                expect(labelLineContent.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let labelLineContentByEnums = PieSerie.LabelLineContent(
                    .show(showLabelLineContentValue),
                    .length(lengthLabelLineContentValue),
                    .length2(length2LabelLineContentValue),
                    .smooth(smoothLabelLineContentValue),
                    .lineStyle(lineStyleLabelLineContentValue)
                )
                
                expect(labelLineContentByEnums.jsonString).to(equal(labelLineContent.jsonString))
            }
        }
        
        let normalLabelLineValue = labelLineContent
        let emphasisLabelLineValue = PieSerie.LabelLineContent(
            .show(true),
            .length(7.472),
            .length2(47.373),
            .smooth(false),
            .lineStyle(LineStyle())
        )
        
        let labelLine = PieSerie.LabelLine()
        labelLine.normal = normalLabelLineValue
        labelLine.emphasis = emphasisLabelLineValue
        
        describe("For PieSerie.LabelLien") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "normal": normalLabelLineValue,
                    "emphasis": emphasisLabelLineValue
                ]
                
                expect(labelLine.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let labelLineByEnums = PieSerie.LabelLine(
                    .normal(normalLabelLineValue),
                    .emphasis(emphasisLabelLineValue)
                )
                
                expect(labelLineByEnums.jsonString).to(equal(labelLine.jsonString))
            }
        }
    }
}
