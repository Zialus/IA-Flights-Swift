
import Foundation

// Makes class Airport Equatable
func == (lhs: Airport, rhs: Airport) -> Bool {
    return lhs.city == rhs.city
}


// Store debug information that will be given by cmdLine Args
var DEBUG = false
var FULLDEBUG = false

// Will Store the location of the input file which cotains the timetables info
var filelocation: String = ""

// Store the list of Airports
var airportList = Set<Airport>()

// Process the given cmdLine Args
proccessCmdLineArgs()

// Process the contents of the input file
processFile()

welcomeMessage()

// Menu Loop
while true {
    switch menu() {
    case 1:
        searchDirectFlights()
    case 2:
        searchRoutes()
    case 3:
        searchCircuits()
    case 9:
        print("Show me the way way out!!!")
        exit(0)
    default:
        print ("Invalid option!")
    }

}
