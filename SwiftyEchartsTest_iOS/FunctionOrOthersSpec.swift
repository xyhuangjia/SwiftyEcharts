//
//  FunctionOrOthersSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 20/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class FunctionOrOthersSpec: QuickSpec {
    
    override func spec() {
        describe("For FunctionOrFloat") {
            let floatValue: Float = 3.1415
            let functionString = "function (idx) {return idx * 0.65;}"
            it(" needs to check the jsonString ") {
                let floatCase = FunctionOrFloat.value(floatValue)
                expect(floatCase.jsonString).to(equal(floatValue.jsonString))
                
                let functionCase = FunctionOrFloat.function(functionString)
                JsCache.removeAll()
                expect(functionCase.jsonString).to(equal("\(FunctionPrefix)0".jsonString))
                expect(JsCache.allJsStrings().count).to(equal(1))
                expect(JsCache.allJsStrings().first).to(equal("var \(FunctionPrefix)0 = \(functionString);"))
            }
            
            it(" needs to check the literal convertiable ") {
                let integerValue: Int = 10
                let floatLiteralCase: FunctionOrFloat = 3.1415
                let integerLieteralCase: FunctionOrFloat = 10
                
                expect(floatLiteralCase.jsonString).to(equal(floatValue.jsonString))
                expect(integerLieteralCase.jsonString).to(equal(Float(integerValue).jsonString))
            }
        }
    }

}