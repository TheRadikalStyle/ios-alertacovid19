//
//  HeatmapData.swift
//  AlertaCOVID19
//
//  Created by David Ochoa on 07/04/20.
//  Copyright © 2020 David Ochoa. All rights reserved.
//

import Foundation

class HeatmapData{
    var latitud :Double?
    var longitud :Double?
    
    func LocationData(lat :Double, longi :Double){
        self.latitud = lat
        self.longitud = longi
    }
}
