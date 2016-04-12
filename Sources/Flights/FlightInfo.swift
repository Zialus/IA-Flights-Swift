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
    let timeLeaving: String
    let timeArrival: String
    let days: [String:Bool]

    init(code: String, destination: String, timeLeaving: String, timeArrival: String, days: [String:Bool]) {
        self.code = code
        self.destination = destination
        self.timeLeaving = timeLeaving
        self.timeArrival = timeArrival
        self.days = days
    }

}

extension FlightInfo: CustomStringConvertible {

    var description: String {
        return "Code: \(code) | Destination: \(destination) | TimeLeaving: \(timeLeaving) | TimeArrival: \(timeArrival) | Days: \(days)"
    }

}