//
//  FlightInfo.swift
//  Flights
//
//  Created by Raul Ferreira on 4/11/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

class FlightInfo {
    let Code: String
//    let Source: String
    let Destination: String
    let TimeLeaving:Int
    let TimeArrival:Int
    let Days: [String]



    init(Code: String, Destination: String, TimeLeaving:Int, TimeArrival:Int, Days: [String]) {
        self.Code = Code
        self.Destination = Destination
        self.TimeLeaving = TimeLeaving
        self.TimeArrival = TimeArrival
        self.Days = Days
    }

}