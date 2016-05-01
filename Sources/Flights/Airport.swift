import Foundation

class Airport {
    let city: String
    var flights: [FlightInfo]

    init(city: String) {
        self.city = city
        self.flights = []
    }

}

extension Airport: CustomStringConvertible {

    var description: String {
        return "City: \(city) --- Flights: \(flights)"
    }

}

extension Airport: Hashable {

    var hashValue: Int {
        return self.city.hashValue
    }

}

// Makes the class Airport Equatable
func == (lhs: Airport, rhs: Airport) -> Bool {
    return lhs.city == rhs.city
}
