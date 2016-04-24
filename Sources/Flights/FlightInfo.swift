import Foundation

class FlightInfo {
    let code: String
    let destination: String
    let timeLeaving: Int
    let timeArrival: Int
    let days: [String:Bool]

    init(code: String, destination: String, timeLeaving: String, timeArrival: String, days: [String:Bool]) {
        self.code = code
        self.destination = destination
        self.timeLeaving = timeToMins(timeLeaving)
        self.timeArrival = timeToMins(timeArrival)
        self.days = days
    }

}

extension FlightInfo: CustomStringConvertible {

    var description: String {
        return "Code: \(code) | Destination: \(destination) | TimeLeaving: \(timeLeaving) | TimeArrival: \(timeArrival) | Days: \(days)"
    }

}
