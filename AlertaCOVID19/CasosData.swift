//
//  CasosData.swift
//  AlertaCOVID19
//
//  Created by David Ochoa on 05/04/20.
//  Copyright © 2020 David Ochoa. All rights reserved.
//

import Foundation

class CasosData{
    var municipio :String?
    var casos :String?
    var location :String?
    
    func CasosData(mun :String, cas :String, loc :String){
        self.municipio = mun
        self.casos = cas
        self.location = loc
    }
}
