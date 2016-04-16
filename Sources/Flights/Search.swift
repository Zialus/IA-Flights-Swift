//
//  Search.swift
//  Flights
//
//  Created by Raul Ferreira on 4/12/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

func findDirectFlight(origin: String, destination: String) -> (Set<String>) {

    var daysAvailableList = Set<String>()

    let airportOrigin = Airport(city: origin)

    if airportList.contains(airportOrigin) {

        let indexAirport = airportList.indexOf(airportOrigin)

        for flight in airportList[indexAirport!].flights {
            if flight.destination == destination {

                for (day, bool) in flight.days {
                    if bool == true {
                        daysAvailableList.insert(day)
                    }
                }
            }
        }

    } else {
        print("The departure airport does not exist")
    }

    return daysAvailableList

}


func findRouteSameDay(origin origin: String, arrival: String, currentDay: String, currentCity: String, currentTime: Int) -> ([String]) {


    if currentCity==arrival {
        var route = [String]()
        route.append(currentCity)
        return route
    }

    let airportCity = Airport(city: currentCity)

    if airportList.contains(airportCity) {

        let indexAirport = airportList.indexOf(airportCity)


        for flight in airportList[indexAirport!].flights where flight.days[currentDay] == true {

            if flight.timeLeaving >= currentTime + 40 {

                var route = [String]()

                route.append(currentCity)
                route.append("->")
                route.append("Code: \(flight.code), Time: \(minsToTime(flight.timeLeaving))/\(minsToTime(flight.timeArrival))")
                route.append("->")

                route += findRouteSameDay(origin: origin, arrival: arrival, currentDay: currentDay, currentCity: flight.destination, currentTime: flight.timeArrival)

                if route.last == arrival {
                    return route
                }
            }

        }

    } else {
        print("The departure airport does not exist")
    }

    let route = [String]()

    return route

}
