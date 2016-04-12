//
//  Search.swift
//  Flights
//
//  Created by Raul Ferreira on 4/12/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

func findDirectFlight(origin: String, Destination: String) -> (Set<String>) {

    print("Checking flights between \(origin) and \(Destination)")

    var daysAvailableList = Set<String>()

    let airportOrigin = Airport(city: origin)


//    for crap in airportList {
//        print(crap.city)
//    }

    if airportList.contains(airportOrigin){

        let indexAirport = airportList.indexOf(airportOrigin)

        for trips in airportList[indexAirport!].flights {
            if trips.destination == Destination {

                for (day,bool) in trips.days{
                    if bool == true {
                        daysAvailableList.insert(day)
                    }
                }
            }
        }



    }
    else{
        print("That airport doesn't exist")
    }

    return daysAvailableList

}