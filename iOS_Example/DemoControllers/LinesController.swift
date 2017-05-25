//
//  LinesController.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 25/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import UIKit
import SwiftyEcharts

class LinesController: BaseDemoController {
    
    private var timer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus = ["雨量流量关系图", "大数据量面积图", "堆叠区域图", "Confidence Band(暂缺)", "动态数据 + 时间坐标轴", "雨量流量关系图", "Beijing AQI", "Try Dragging these Points(暂缺)", "Different Easing Functions(暂缺)", "对数轴示例", "未来一周气温变化", "Click to Add Points(暂缺)", "极坐标双数值轴", "极坐标双数值轴", "一天用电量分布", "折线图堆叠", "Step Line", "高度(km)与气温(°C)变化关系"]
        
        optionClosures = [LineOptions.areaRainfallOption, LineOptions.areaSimpleOption, LineOptions.areaStackOption, LineOptions.confidenceBandOption, LineOptions.dynamicData2Option, LineOptions.gridMultipleOption, LineOptions.lineApiOption, LineOptions.lineDraggableOption, LineOptions.lineEasingOption, LineOptions.lineLogOption, LineOptions.lineMarkerOption, LineOptions.linePenOption, LineOptions.linePolarOption, LineOptions.linePolar2Option, LineOptions.lineSectionsOption, LineOptions.lineStackOption, LineOptions.lineStepOption, LineOptions.lineYCategoryOption]
        
        self.title = "折线图"
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        super.tableView(tableView, didSelectRowAtIndexPath: indexPath)
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
        
        if indexPath.row == 4 { // 动态数据 + 时间坐标轴
            timer = NSTimer(timeInterval: 1.0, target: self, selector: #selector(self.dynamicData), userInfo: nil, repeats: true)
            NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
        }
    }
    
    func dynamicData() {
        if let serie = self.option.series?[0] as? LineSerie {
            for _ in 0 ..< 5 {
                LineOptions.data.removeFirst()
                LineOptions.data.append(LineOptions.randomData())
            }
            serie.data = LineOptions.data
            self.option.series = [serie]
            self.echartsView.refreshEcharts(self.option, true)
        }
    }
}

