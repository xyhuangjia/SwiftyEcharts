//
//  MapsController.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 15/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import UIKit
import SwiftyEcharts

class MapsController: BaseDemoController {
    
    private var timer: NSTimer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus = ["模拟迁徙(暂缺)", "65k+ 飞机航线(暂缺)", "北京公交路线 - 百度地图(暂缺)", "北京公交路线 - 线特效(暂缺)", "杭州热门步行路线 - 百度地图(暂缺)", "iPhone销量", "Map China", "香港18区人口密度 （2011）(暂缺)", "Map Locate(暂缺)", "34 省切换查看(暂缺)", "USA Population Estimates (2012)(暂缺)", "World Population (2010)(暂缺)", "map and scatter share a geo(暂缺)", "Map World"]
        
        optionClosures = [MapOptions.geoLinesOption, MapOptions.linesAirlineOption, MapOptions.linesBmapBusOption, MapOptions.linesBmapEffectOption, MapOptions.linesBmapOption, MapOptions.mapChinaDataRangeOption, MapOptions.mapChinaOption, MapOptions.mapHKOption, MapOptions.mapLocateOption, MapOptions.mapProvinceOption, MapOptions.mapUsaOption, MapOptions.mapWorldDataRangeOption, MapOptions.geoMapScatterOption, MapOptions.mapWorldOption]
        
        self.title = "地图"
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        super.tableView(tableView, didSelectRowAtIndexPath: indexPath)
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
        switch indexPath.row {
        case 8:
            
            timer = NSTimer(timeInterval: 2, target: self, selector: #selector(self.mapLocateOption), userInfo: nil , repeats: true)
        default:
            print("Nothing...")
        }
        
        if timer != nil {
            NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
        }
    }
    
    private var currLoc = 0
    func mapLocateOption() {
        let location: [[String: Jsonable]] = [[
            "name": "上海",
            "coord": [121.472644, 31.231706]
            ], [
                "name": "北京",
                "coord": [116.405285, 39.904989]
            ], [
                "name": "广东",
                "coord": [113.280637, 23.839463714285714]
            ]]
        var tmpOpt = self.option
        var serie = tmpOpt.series![0] as! MapSerie
        serie.center = location[currLoc]["coord"] as? Position
        serie.zoom = 4
        let data: [String: Jsonable] = ["name": location[currLoc]["name"]!, "selected": true]
        serie.data = [data]
        serie.animationDurationUpdate = 1000.0
        serie.animationEasingUpdate = .cubicInOut
        tmpOpt.series = [serie]
        echartsView.refreshEcharts(tmpOpt)
        print(serie.jsonString)
        currLoc = (currLoc + 1) % location.count
    }

    

}