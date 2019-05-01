import Foundation

func findDirectFlight(origin: String, destination: String) -> (Set<String>) {

    var daysAvailableList = Set<String>()

    let airportOrigin = Airport(city: origin)

    if airportList.contains(airportOrigin) {

        let indexAirport = airportList.firstIndex(of: airportOrigin)

        for flight in airportList[indexAirport!].flights where flight.destination == destination {

                for (day, bool) in flight.days where bool == true {
                        daysAvailableList.insert(day)
                }

        }

    } else {
        print("The departure airport does not exist")
    }

    return daysAvailableList

}

func findRouteSameDay(origin: String, arrival: String, currentDay: String, currentCity: String, currentTime: Int) {

    if currentCity==arrival {
        printfulldebug("----------Found an answer--------START----------")
        printfulldebug(stack)
        printfulldebug("----------Found an answer--------END------------")
        stackList.append(stack)
        return
    }

    let airportCity = Airport(city: currentCity)

    if airportList.contains(airportCity) {

        let indexAirport = airportList.firstIndex(of: airportCity)

        for flight in airportList[indexAirport!].flights where flight.days[currentDay] == true {

            printfulldebug("Current state of the Stack \(stack)")

            printdebug("\n Trying to fly from \(currentCity) to \(flight.destination) on the flight \(flight.destination)\n")

            if flight.timeLeaving >= currentTime + 40 {

                printdebug("Was able to catch the flight on time. From \(currentCity) to \(flight.destination)\n")

                stack.push("\(currentCity) ----> [Code: \(flight.code), Time: \(minsToTime(flight.timeLeaving))/\(minsToTime(flight.timeArrival))] ----> \(flight.destination)")

                findRouteSameDay(origin: origin, arrival: arrival, currentDay: currentDay, currentCity: flight.destination, currentTime: flight.timeArrival)

                _ = stack.pop()
            }

        }

    } else {
        print("The departure airport does not exist")
    }

    return
}

func findCircuits(origin: String, arrival: String, currentDay: String, currentCity: String, citiesToVisit: [String]) -> ([String]) {

    var citiesNotVisited = citiesToVisit

    if citiesNotVisited.isEmpty {

        let destDays = findDirectFlight(origin: currentCity, destination: arrival)

        if destDays.contains(currentDay) {
            var route = [String]()
            route.append(currentCity)
            route.append(currentDay)
            route.append(arrival)
            return route
        } else {
            let route = [String]()
            return route
        }

    } else {

        let dest = citiesNotVisited.remove(at: 0)
        let destDays = findDirectFlight(origin: currentCity, destination: dest)

        if destDays.contains(currentDay) {
            var route = [String]()
            route.append(currentCity)
            route.append(currentDay)

            let nextDay = dayAfter(currentDay)
            route += findCircuits(origin: origin, arrival: arrival, currentDay: nextDay, currentCity: dest, citiesToVisit: citiesNotVisited)

            if route.last == arrival {
                return route
            }
        }

    }

    let route = [String]()
    return route

}
