//
//  UserInterface.swift
//  TikTakToe
//
//  Created by Raul Ferreira on 3/17/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

func proccessCmdLineArgs() -> () {

    if Process.arguments.count == 1 {
        print("Too few arguments!")
        exit(1)
    } else if Process.arguments.count == 2 {

        print("Welcome to a silly little app that does stuff!")
        print()
        print("All debug functionality is turned OFF")
        filelocation = Process.arguments[1]

    } else if Process.arguments.count > 3 {
        print("Too many arguments!")
        exit(1)
    } else if Process.arguments.count == 3 {

        print("Welcome to a silly little app that does stuff!\n")

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
    print ("\nMenu:")
    print ("(1) Search Direct Flights")
    print ("(2) Search Routes")
    print ("(3) Search Circuits")
    print ("Choose your option:")


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

    while origin == nil {

        print("\nInsert the departure city name:")
        if let userInput = readLine(stripNewline: true) {
            origin = userInput
        } else {
            print("something weird happend...")
        }

    }

    while destination == nil {

        print("Insert the arrival city name:")
        if let userInput = readLine(stripNewline: true) {
            destination = userInput
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
