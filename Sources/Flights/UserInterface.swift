import Foundation
import Rainbow

func printInstructions() {
    print(ANSI.yellow)
    print("  .-----------------------------------------------------------------.")
    print(" /  .-.                                                         .-.  \\")
    print("|  /   \\      \(ANSI.cyan)./Flights\(ANSI.yellow) [file with routes] <extra args>        /   \\  |")
    print("| |\\_.  |                                                     |    /| |")
    print("|\\|  | /|      debug:     Activates basic debug info          |\\  | |/|")
    print("| `---' |      fulldebug: Activates the full debug info       | `---' |")
    print("|       |                                                     |       |")
    print("|       |-----------------------------------------------------|       |")
    print("\\       |                                                     |       /")
    print(" \\     /                                                       \\     /")
    print("  `---'                                                         `---'")
    print()
}

func welcomeMessage() {
    print(ANSI.blue)
    print("    _____ _     _       _         _           _                 _ _ _")
    print("   |_   _| |__ (_)___  (_)___    (_)_   _ ___| |_    __ _   ___(_) | |_   _")
    print("     | | | '_ \\| / __| | / __|   | | | | / __| __|  / _` | / __| | | | | | |")
    print("     | | | | | | \\__ \\ | \\__ \\   | | |_| \\__ \\ |_  | (_| | \\__ \\ | | | |_| |")
    print("     |_| |_| |_|_|___/ |_|___/  _/ |\\__,_|___/\\__|  \\__,_| |___/_|_|_|\\__, |")
    print("                               |__/                                   |___/")
    print("        _____ _ _       _     _      ____ _               _")
    print("       |  ___| (_) __ _| |__ | |_   / ___| |__   ___  ___| | _____ _ __")
    print("       | |_  | | |/ _` | '_ \\| __| | |   | '_ \\ / _ \\/ __| |/ / _ \\ '__|")
    print("       |  _| | | | (_| | | | | |_  | |___| | | |  __/ (__|   <  __/ |")
    print("       |_|   |_|_|\\__, |_| |_|\\__|  \\____|_| |_|\\___|\\___|_|\\_\\___|_|")
    print("                  |___/")
    print("          _                  _   _           _         _")
    print("         / \\   _ __  _ __   | |_| |__   __ _| |_    __| | ___   ___  ___")
    print("        / _ \\ | '_ \\| '_ \\  | __| '_ \\ / _` | __|  / _` |/ _ \\ / _ \\/ __|")
    print("       / ___ \\| |_) | |_) | | |_| | | | (_| | |_  | (_| | (_) |  __/\\__ \\")
    print("      /_/   \\_\\ .__/| .__/   \\__|_| |_|\\__,_|\\__|  \\__,_|\\___/ \\___||___/")
    print("              |_|   |_|")
    print("                                               _          __  __")
    print("                ___  ___  _ __ ___   ___   ___| |_ _   _ / _|/ _|")
    print("               / __|/ _ \\| '_ ` _ \\ / _ \\ / __| __| | | | |_| |_")
    print("               \\__ \\ (_) | | | | | |  __/ \\__ \\ |_| |_| |  _|  _|")
    print("               |___/\\___/|_| |_| |_|\\___| |___/\\__|\\__,_|_| |_|")
    print(ANSI.reset)
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
    print()
    print("                                                               .---.")
    print("                                                              /  .  \\")
    print("                                                             |\\_/|   |")
    print("                                                             |   |  /|")
    print("  .----------------------------------------------------------------' |")
    print(" /  .-.                                                              |")
    print("|  /   \\               Menu:                                         |")
    print("| |\\_.  |              (1) Search Direct Flights                     |")
    print("|\\|  | /|              (2) Search Routes                             |")
    print("| `---' |              (3) Search Circuits                           |")
    print("|       |              (9) Exit!                                     |")
    print("|       |                                                           /")
    print("|       |----------------------------------------------------------'")
    print("\\       |")
    print(" \\     /")
    print("  `---'")
    print()
    print("Choose your option: ", terminator: "")


    if let userInput = readLine(strippingNewline: true) {
        if let res = Int(userInput) {
            return res
        }
    }

    return 0

}

func searchDirectFlights() -> Void {

    var origin: String! = nil
    var destination: String! = nil

    originLoop: while origin == nil {

        print("\nInsert the departure city name:")
        if let userInput = readLine(strippingNewline: true) {

            let airportOrigin = Airport(city: userInput)

            if !airportList.contains(airportOrigin) {
                print()
                print("The city: \"\(userInput)\" does not have an airport!")
                print()
                usleep(600000)
                continue originLoop

            } else {
                origin = userInput
            }


        } else {
            print("something weird happend...")
        }

    }

    destinationLoop: while destination == nil {

        print("Insert the arrival city name:")
        if let userInput = readLine(strippingNewline: true) {

            let airportDestination = Airport(city: userInput)

            if !airportList.contains(airportDestination) {
                print()
                print("The city: \"\(userInput)\" does not have an airport!")
                print()
                usleep(600000)
                continue destinationLoop

            } else {

                destination = userInput
            }


        } else {
            print("something weird happend...")
        }

    }

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

    var origin: String! = nil
    var destination: String! = nil
    var day: String! = nil

    originLoop: while origin == nil {

        print("\nInsert the departure city name:")
        if let userInput = readLine(strippingNewline: true) {

            let airportOrigin = Airport(city: userInput)

            if !airportList.contains(airportOrigin) {
                print()
                print("The city: \"\(userInput)\" does not have an airport!")
                print()
                usleep(600000)
                continue originLoop

            } else {
                origin = userInput
            }


        } else {
            print("something weird happend...")
        }

    }

    destinationLoop: while destination == nil {

        print("Insert the arrival city name:")
        if let userInput = readLine(strippingNewline: true) {

            let airportDestination = Airport(city: userInput)

            if !airportList.contains(airportDestination) {
                print()
                print("The city: \"\(userInput)\" does not have an airport!")
                print()
                usleep(600000)
                continue destinationLoop

            } else {

                destination = userInput
            }


        } else {
            print("something weird happend...")
        }

    }

    dayLoop: while day == nil {

        print("Insert the day to look up:")
        if let userInput = readLine(strippingNewline: true) {

            if userInput != "mo" && userInput != "tu" && userInput != "we" && userInput != "th" && userInput != "fr" && userInput != "sa" && userInput != "su" {
                print()
                print("Incorrect day! Day: \"\(userInput)\" is not valid! \t Be more careful!")
                print()
                usleep(600000)
                continue dayLoop
            } else {
                day = userInput
            }

        } else {
            print("something weird happend...")
        }

    }

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

    var origin: String! = nil
    var destination: String! = nil
    var day: String! = nil

    originLoop: while origin == nil {

        print("\nInsert the departure city name:")
        if let userInput = readLine(strippingNewline: true) {

            let airportOrigin = Airport(city: userInput)

            if !airportList.contains(airportOrigin) {
                print()
                print("The city: \"\(userInput)\" does not have an airport!")
                print()
                usleep(600000)
                continue originLoop

            } else {
                origin = userInput
            }

        } else {
            print("something weird happend...")
        }

    }

    destinationLoop: while destination == nil {

        print("Insert the arrival city name:")
        if let userInput = readLine(strippingNewline: true) {

            let airportDestination = Airport(city: userInput)

            if !airportList.contains(airportDestination) {
                print()
                print("The city: \"\(userInput)\" does not have an airport!")
                print()
                usleep(600000)
                continue destinationLoop

            } else {

                destination = userInput
            }


        } else {
            print("something weird happend...")
        }

    }

    dayLoop: while day == nil {

        print("Insert the day to start the journey:")
        if let userInput = readLine(strippingNewline: true) {

            if userInput != "mo" && userInput != "tu" && userInput != "we" && userInput != "th" && userInput != "fr" && userInput != "sa" && userInput != "su" {
                print()
                print("Incorrect day! Day: \"\(userInput)\" is not valid! \t Be more careful!")
                print()
                usleep(600000)
                continue dayLoop
            } else {
                day = userInput
            }

        } else {
            print("something weird happend...")
        }

    }

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

    citiesLoop: while citiesToVisit.count != numberOfCities {

        print("Insert the name of city number \(citiesToVisit.count+1):")
        if let userInput = readLine(strippingNewline: true) {

            let airport = Airport(city: userInput)

            if !airportList.contains(airport) {
                print()
                print("The city: \"\(userInput)\" does not have an airport!")
                print()
                usleep(600000)
                continue citiesLoop

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
