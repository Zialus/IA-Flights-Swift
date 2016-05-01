import Foundation

// TODO: I really need to find a better way to do this, making this global instead of local is super hacky
var stack = Stack<String>()
var stackList = [Stack<String>]()

// Store debug information that will be given by cmdLine Args
var DEBUG = false
var FULLDEBUG = false

// Will store the location of the input file which cotains the timetables info
var filelocation: String = ""

// Store the list of Airports (without duplicates, obviously)
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
        usleep(600000)
    }

}
