//
//  FlightInfo.swift
//  Flights
//
//  Created by Raul Ferreira on 4/11/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

class FlightInfo {
    let code: String
//    let Source: String
    let destination: String
    let timeLeaving: Int
    let timeArrival: Int
    let days: [String]

    init(code: String, destination: String, timeLeaving: Int, timeArrival: Int, days: [String]) {
        self.Code = Code
        self.Destination = Destination
        self.TimeLeaving = TimeLeaving
        self.TimeArrival = TimeArrival
        self.Days = Days
    }

}
