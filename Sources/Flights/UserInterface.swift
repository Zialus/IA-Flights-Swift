import Foundation
import Rainbow

func printInstructions() {
    let instructions = """

         .-----------------------------------------------------------------.
        /  .-.                                                         .-.  \\

    """.yellow

+  "   |  /   \\      ".yellow + "./Flights".cyan + " [file with routes] <extra args>        /   \\  |".yellow

+   """

       | |\\_.  |                                                     |    /| |
       |\\|  | /|      debug:     Activates basic debug info          |\\  | |/|
       | `---' |      fulldebug: Activates the full debug info       | `---' |
       |       |                                                     |       |
       |       |-----------------------------------------------------|       |
       \\       |                                                     |       /
        \\     /                                                       \\     /
         `---'                                                         `---'

    """.yellow
    print(instructions)
}

func welcomeMessage() {
    let welcomeMessage = """

        _____ _     _       _         _           _                 _ _ _
       |_   _| |__ (_)___  (_)___    (_)_   _ ___| |_    __ _   ___(_) | |_   _
         | | | '_ \\| / __| | / __|   | | | | / __| __|  / _` | / __| | | | | | |
         | | | | | | \\__ \\ | \\__ \\   | | |_| \\__ \\ |_  | (_| | \\__ \\ | | | |_| |
         |_| |_| |_|_|___/ |_|___/  _/ |\\__,_|___/\\__|  \\__,_| |___/_|_|_|\\__, |
                                   |__/                                   |___/
            _____ _ _       _     _      ____ _               _
           |  ___| (_) __ _| |__ | |_   / ___| |__   ___  ___| | _____ _ __
           | |_  | | |/ _` | '_ \\| __| | |   | '_ \\ / _ \\/ __| |/ / _ \\ '__|
           |  _| | | | (_| | | | | |_  | |___| | | |  __/ (__|   <  __/ |
           |_|   |_|_|\\__, |_| |_|\\__|  \\____|_| |_|\\___|\\___|_|\\_\\___|_|
                      |___/
              _                  _   _           _         _
             / \\   _ __  _ __   | |_| |__   __ _| |_    __| | ___   ___  ___
            / _ \\ | '_ \\| '_ \\  | __| '_ \\ / _` | __|  / _` |/ _ \\ / _ \\/ __|
           / ___ \\| |_) | |_) | | |_| | | | (_| | |_  | (_| | (_) |  __/\\__ \\
          /_/   \\_\\ .__/| .__/   \\__|_| |_|\\__,_|\\__|  \\__,_|\\___/ \\___||___/
                  |_|   |_|
                                                   _          __  __
                    ___  ___  _ __ ___   ___   ___| |_ _   _ / _|/ _|
                   / __|/ _ \\| '_ ` _ \\ / _ \\ / __| __| | | | |_| |_
                   \\__ \\ (_) | | | | | |  __/ \\__ \\ |_| |_| |  _|  _|
                   |___/\\___/|_| |_| |_|\\___| |___/\\__|\\__,_|_| |_|

    """
    print(welcomeMessage.blue)
}

func proccessCmdLineArgs() -> Void {

    if CommandLine.arguments.count < 2 {
        print()
        print("Too few arguments!".red + " Try launching with the argument \"--help\" ")
        print()
        exit(1)
    } else if CommandLine.arguments[1] == "--help" {

        printInstructions()
        exit(0)

    } else if CommandLine.arguments.count == 2 {

        print("All debug functionality is turned " + "OFF".red.blink + "!")
        print()
        filelocation = CommandLine.arguments[1]

    } else if CommandLine.arguments.count > 3 {
        print()
        print("Too many arguments!".red + "Try launching with the argument \"--help\" ")
        print()
        exit(1)
    } else if CommandLine.arguments.count == 3 {

        filelocation = CommandLine.arguments[1]
        let onlyArg = CommandLine.arguments[2]

        switch onlyArg {
        case "debug":
            print("Debug Mode is " + "ON".green.bold + "!")
            print()

            DEBUG=true
        case "fulldebug":
            print("Full Debug mode is " + "ON".green + "!!!")
            print()

            DEBUG=true
            FULLDEBUG=true
        default:
            print()
            print("What are you trying to do!?".red + " \n\"\(onlyArg)\" is an unrecognized argument")
            print()
            exit(1)
        }

    }

}

func menu() -> (Int) {
    let menu = """

                                                                      .---.
                                                                     /  .  \\
                                                                    |\\_/|   |
                                                                    |   |  /|
         .----------------------------------------------------------------' |
        /  .-.                                                              |
       |  /   \\               Menu:                                         |
       | |\\_.  |              (1) Search Direct Flights                     |
       |\\|  | /|              (2) Search Routes                             |
       | `---' |              (3) Search Circuits                           |
       |       |              (9) Exit!                                     |
       |       |                                                           /
       |       |----------------------------------------------------------'
       \\       |
        \\     /
         `---'

    """
    print(menu)
    print("Choose your option: ", terminator: "")

    if let userInput = readLine(strippingNewline: true) {
        if let res = Int(userInput) {
            return res
        }
    }

    return 0

}

func searchDirectFlights() -> Void {

    let (origin, destination) = readOriginDestinationInput()

    print("\nChecking flights between \(origin) and \(destination)...\n")

    let result = findDirectFlight(origin: origin, destination: destination)

    if result.count == 0 {
        print("There are no flights available between \(origin) and \(destination) !")
    } else if result.count == 7 {
        print("There are flights available all days of the week!")
    } else {
        print("There are flights available in \(result.count) different days, those days are:")
        listOfDaysPrettyPrinting(result)
    }

}

func searchRoutes() -> Void {

    let (origin, destination) = readOriginDestinationInput()
    let day = readDayInput()

    print("\n\nTrying to find a route between \(origin) and \(destination)...")

    // TODO: I really need to find a better way to do this, i should just be creating a new local variable
    stack = Stack<String>()
    stackList = [Stack<String>]()

    findRouteSameDay(origin: origin, arrival: destination, currentDay: day, currentCity: origin, currentTime: 0)

    if stackList.count == 0 {
        print("There is no way to get from \(origin) to \(destination) on \(day)!")
    } else {
        print()
        if stackList.count == 1 {
            print("There is only one way to get from \(origin) to \(destination) on \(day).")
            print("\nHere it is:")
        } else {
            print("There are \(stackList.count) different wats to get from \(origin) to \(destination) on \(dayPrettyPrinting(day)).")
            print("\nHere they are:")
        }

        for stack in stackList {
            print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
            for result in stack.reversed() {
                print(result)
            }
            print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
        }

    }

}

func searchCircuits() -> Void {

    let (origin, destination) = readOriginDestinationInput()
    let day = readDayInput()

    var citiesToVisit = [String]()
    var numberOfCities: Int?

    while numberOfCities == nil {

        print("Insert the number of cities to be visited in-between:")
        if let userInput = readLine(strippingNewline: true) {
            numberOfCities = Int(userInput)
            if numberOfCities == nil {print("That's not a number...")}
        } else {
            print("something weird happend...")
        }

    }

    while citiesToVisit.count != numberOfCities {
        print("Insert the name of city number \(citiesToVisit.count+1):")

        if let userInput = readLine(strippingNewline: true) {

            let airport = Airport(city: userInput)

            if !airportList.contains(airport) {
                print()
                print("The city: \"\(userInput)\" does not have an airport!")
                print()
                usleep(600000)
            } else {
                citiesToVisit.append(userInput)
            }

        } else {
            print("something weird happend...")
        }
    }

    let allPossibleVisitOrders = permutations(citiesToVisit)

    var foundSolution = false
    for orderOfVisit in allPossibleVisitOrders {

        printfulldebug("\nTrying the following order of visit: \(orderOfVisit)... ")

        let result = findCircuits( origin: origin, arrival: destination, currentDay: day, currentCity: origin, citiesToVisit: orderOfVisit)

        if !result.isEmpty {

            foundSolution = true

            print()
            print("\nFound a solution:")
            print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")

            for (index, element) in result.enumerated() {

                if (index == 0) { print ("| Starting the route from: \(element) ", terminator: "\n")}
                else if (index%2 != 0) { print("| Catching a flight [ \(dayPrettyPrinting(element)) ]", terminator: "") }
                else if (index%2 == 0) { print(" to arrive at [ \(element) ] ", terminator: "\n") }

            }

            print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")

        }

    }

    if foundSolution == false {
        print()
        print("No solution was found")
        print()
    }

}

func readOriginDestinationInput() -> (String, String) {

    var originTEMP: String?
    var destinationTEMP: String?

    while originTEMP == nil {
        print("\nInsert the departure city name:")

        if let userInput = readLine(strippingNewline: true) {
            let airportOrigin = Airport(city: userInput)

            if !airportList.contains(airportOrigin) {
                print()
                print("The city: \"\(userInput)\" does not have an airport!")
                print()
                usleep(600000)
            } else {
                originTEMP = userInput
            }

        } else {
            print("something weird happend...")
        }
    }

    while destinationTEMP == nil {
        print("Insert the arrival city name:")

        if let userInput = readLine(strippingNewline: true) {
            let airportDestination = Airport(city: userInput)

            if !airportList.contains(airportDestination) {
                print()
                print("The city: \"\(userInput)\" does not have an airport!")
                print()
                usleep(600000)
            } else {
                destinationTEMP = userInput
            }

        } else {
            print("something weird happend...")
        }
    }

    let origin = originTEMP!
    let destination = destinationTEMP!
    return (origin, destination)

}

func readDayInput() -> (String) {

    var dayTEMP: String?

    while dayTEMP == nil {
        print("Insert the day to start the journey:")

        if let userInput = readLine(strippingNewline: true) {

            if userInput != "mo" && userInput != "tu" && userInput != "we" &&
                userInput != "th" && userInput != "fr" && userInput != "sa" && userInput != "su" {
                print()
                print("Incorrect day! Day: \"\(userInput)\" is not valid! \t Be more careful!")
                print()
                usleep(600000)
            } else {
                dayTEMP = userInput
            }

        } else {
            print("something weird happend...")
        }
    }

    let day = dayTEMP!
    return day
}
