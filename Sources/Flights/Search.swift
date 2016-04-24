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
                route.append("-->Take the flight-->")
                route.append("Code: \(flight.code), Time: \(minsToTime(flight.timeLeaving))/\(minsToTime(flight.timeArrival))")
                route.append("-->You'll arrive at-->")

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

func findCircuits(origin origin: String, arrival: String, currentDay: String, currentCity: String, currentTime: Int, citiesToVisit: [String]) -> ([String]) {

    if citiesToVisit.isEmpty {
        let route = findRouteSameDay(origin: currentCity, arrival: arrival, currentDay: currentDay, currentCity: currentCity, currentTime: 0)
        return route
    }




    let route = [String]()
    return route




}
