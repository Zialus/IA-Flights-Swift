
import Foundation

func printInstructions() {

    print("  .-----------------------------------------------------------------.")
    print(" /  .-.                                                         .-.  \\")
    print("|  /   \\       ./ Flights [rotas.txt] <extra args>             /   \\  |")
    print("| |\\_.  |                                                     |    /| |")
    print("|\\|  | /|      debug:     Activates basic debug info          |\\  | |/|")
    print("| `---' |      fulldebug: Activates the full debug info       | `---' |")
    print("|       |                                                     |       |")
    print("|       |-----------------------------------------------------|       |")
    print("\\       |                                                     |       /")
    print(" \\     /                                                       \\     /")
    print("  `---'                                                         `---'")


}

func welcomeMessage() {
    print("Welcome to a silly little app that does stuff!\n")
}

func proccessCmdLineArgs() -> () {

    if Process.arguments.count < 2  {

        print("Too few arguments! try launching with the argument \"help\" ")
        exit(1)

    } else if Process.arguments[1] == "help" {

        printInstructions()
        exit(0)

    } else if Process.arguments.count == 2 {

        print("All debug functionality is turned OFF")
        filelocation = Process.arguments[1]

    } else if Process.arguments.count > 3 {

        print("Too many arguments!")
        exit(1)

    } else if Process.arguments.count == 3 {

        filelocation = Process.arguments[1]
        let onlyArg = Process.arguments[2]

        switch onlyArg {
        case "debug":
            print("debug mode is ON!")
            DEBUG=true
        case "fulldebug":
            print("full debug mode is ON!!!")
            DEBUG=true
            FULLDEBUG=true
        default:
            print("LOLWUT!? \"\(onlyArg)\": is an unrecognized argument")
            exit(1)
        }

    }

}

func menu() -> (Int) {


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

    print ("Choose your option: ",terminator:"")


    if let userInput = readLine(stripNewline: true) {
        if let res = Int(userInput) {
            return res
        }
    }

    return 0

}

func searchDirectFlights() -> () {

    var origin: String? = nil
    var destination: String? = nil


    originLoop: while origin == nil {

        print("\nInsert the departure city name:")
        if let userInput = readLine(stripNewline: true) {

            let airportOrigin = Airport(city: userInput)

            if !airportList.contains(airportOrigin) {
                print()
                print("The city: \"\(userInput)\" does not have an airport!")
                print()
                sleep(1)
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
                sleep(1)
                continue destinationLoop

            } else {

                destination = userInput
            }


        } else {
            print("something weird happend...")
        }

    }


    print("\nChecking flights between \(origin!) and \(destination!)...\n")

    let result = findDirectFlight(origin!, destination: destination!)

    if result.count == 0 {
        print("There are no flights available between \(origin!) and \(destination!) !")
    } else {
        print("There are flights available in \(result.count) different days \nThe days are: \(result)")
    }



}

func searchRoutes() {

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
                sleep(1)
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
                sleep(1)
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
                sleep(1)
                continue dayLoop
            } else {
                day = userInput
            }

        } else {
            print("something weird happend...")
        }

    }

    let result = findRouteSameDay(origin: origin, arrival: destination, currentDay: day, currentCity: origin, currentTime: 0)

    print(result)

}

func searchCircuits() {

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
                sleep(1)
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
                sleep(1)
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
                sleep(1)
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

        print("\nInsert the number of cities to visited in between:")
        if let userInput = readLine(stripNewline: true) {
            numberOfCities = Int(userInput)
            if numberOfCities == nil {print("That's not a number...")}
        } else {
            print("something weird happend...")
        }

    }

    citiesLoop: while citiesToVisit.count != numberOfCities {

        print("\nInsert the name of a city to visit:")
        if let userInput = readLine(stripNewline: true) {

            let airport = Airport(city: userInput)
            
            if !airportList.contains(airport) {
                print()
                print("The city: \"\(userInput)\" does not have an airport!")
                print()
                sleep(1)
                continue citiesLoop
                
            } else {
                citiesToVisit.append(userInput)
            }
            
            
        } else {
            print("something weird happend...")
        }
        
    }
    
    
    let allPossibleVisitOrders = permutations(citiesToVisit)
    
    for orderOfVisit in allPossibleVisitOrders{
        print("Trying the following order of visit: \(orderOfVisit)")
        let result = findCircuits( origin: origin, arrival: destination, currentDay: day, currentCity: origin, currentTime: 0, citiesToVisit: orderOfVisit)
        print(result)
        
    }
    
    
}