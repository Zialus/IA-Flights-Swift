//
//  Airport.swift
//  Flights
//
//  Created by Raul Ferreira on 4/11/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

class Airport {
    let City: String
    var Flights: [FlightInfo]

    init(City: String) {
        self.City = City
        self.Flights = []
    }
    
}