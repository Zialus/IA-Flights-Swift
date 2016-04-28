import Foundation

func listOfDaysPrettyPrinting(listOfDays: Set<String>) -> () {

    for day in listOfDays {
        switch day {
        case "mo":
            print("Monday")
        case "tu":
            print("Tuesday")
        case "we":
            print("Wednesday")
        case "th":
            print("Thursday")
        case "fr":
            print("Friday")
        case "sa":
            print("Saturday")
        case "su":
            print("Sunday")
        default:
            print("WTF!?")
        }
    }

}

func printInstructions() {
    print(ANSI.Yellow)
    print("  .-----------------------------------------------------------------.")
    print(" /  .-.                                                         .-.  \\")
    print("|  /   \\      \(ANSI.Cyan)./Flights\(ANSI.Yellow) [file with routes] <extra args>        /   \\  |")
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
    print(ANSI.Blue)
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
    print(ANSI.Reset)
}

func proccessCmdLineArgs() -> () {

    if Process.arguments.count < 2 {
        print()
        print("\(Colors.Red("Too few arguments!")) Try launching with the argument \"--help\" ")
        print()
        exit(1)
    } else if Process.arguments[1] == "--help" {

        printInstructions()
        exit(0)

    } else if Process.arguments.count == 2 {

        print("All debug functionality is turned \(Colors.Red("OFF"))!")
        print()
        filelocation = Process.arguments[1]

    } else if Process.arguments.count > 3 {
        print()
        print("\(Colors.Red("Too many arguments!")) Try launching with the argument \"--help\" ")
        print()
        exit(1)
    } else if Process.arguments.count == 3 {

        filelocation = Process.arguments[1]
        let onlyArg = Process.arguments[2]

        switch onlyArg {
        case "debug":
            print("Debug Mode is \(Colors.Green("ON"))!")
            print()

            DEBUG=true
        case "fulldebug":
            print("Full Debug mode is \(Colors.Green("ON"))!!!")
            print()

            DEBUG=true
            FULLDEBUG=true
        default:
            print()
            print("\(Colors.Red("What are you trying to do!?")) \n\"\(onlyArg)\" is an unrecognized argument")
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
    print("Choose your option: ", terminator:"")


    if let userInput = readLine(stripNewline: true) {
        if let res = Int(userInput) {
            return res
        }
    }

    return 0

}

func searchDirectFlights() -> () {

    var origin: String! = nil
    var destination: String! = nil

    originLoop: while origin == nil {

        print("\nInsert the departure city name:")
        if let userInput = readLine(stripNewline: true) {

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
        if let userInput = readLine(stripNewline: true) {

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

func searchRoutes() -> () {

    var origin: String! = nil
    var destination: String! = nil
    var day: String! = nil

    originLoop: while origin == nil {

        print("\nInsert the departure city name:")
        if let userInput = readLine(stripNewline: true) {

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
        if let userInput = readLine(stripNewline: true) {

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
        if let userInput = readLine(stripNewline: true) {

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


    let resultList = findRouteSameDay(origin: origin, arrival: destination, currentDay: day, currentCity: origin, currentTime: 0)


    if resultList.count == 0 {
        print("There is no way to get from \(origin) to \(destination) on \(day)!")
    } else {
        print()
        print("Here are the results of your search:")
        print()
        print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")

        for (index,result) in resultList.enumerate() {
            if (index == 0) { print ("| Starting the route from -----> ",terminator:"")}
            else if (index%2 != 0) { print("| Take the Flight --------> ",terminator:"") }
            else if (index%2 == 0) { print("| Arriving at -------> ",terminator:"") }
            print(result,terminator:"\t\t|\n")
        }

        print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")

    }

}

func searchCircuits() -> () {

    var origin: String! = nil
    var destination: String! = nil
    var day: String! = nil

    originLoop: while origin == nil {

        print("\nInsert the departure city name:")
        if let userInput = readLine(stripNewline: true) {

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
        if let userInput = readLine(stripNewline: true) {

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
        if let userInput = readLine(stripNewline: true) {

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
        if let userInput = readLine(stripNewline: true) {
            numberOfCities = Int(userInput)
            if numberOfCities == nil {print("That's not a number...")}
        } else {
            print("something weird happend...")
        }

    }

    citiesLoop: while citiesToVisit.count != numberOfCities {

        print("Insert the name of city number \(citiesToVisit.count+1):")
        if let userInput = readLine(stripNewline: true) {

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

        if !result.isEmpty{
            print("\nFound a solution:")
            foundSolution = true

            print("Here are the results of your search:")
            print()
            print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")


            for (index,element) in result.enumerate(){

                    if (index == 0) { print ("| Starting the route from -----> ",terminator:"")}
                    else if (index%2 != 0) { print("| Taking the flight on the day --------> ",terminator:"") }
                    else if (index%2 == 0) { print("| Arriving at -------> ",terminator:"") }
                    print(element,terminator:"\t\t|\n")


            }

            print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
            
        }
        
    }
    
    if foundSolution == false{
        print("No solution was found")
    }
    
    
}
