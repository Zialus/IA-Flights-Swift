//
//  main.swift
//  Flights
//
//  Created by Raul Ferreira on 4/8/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

func == (lhs: Airport, rhs: Airport) -> Bool {
    return lhs.city == rhs.city
}


// Store debug information that will be given by cmdline args
var DEBUG = false
var FULLDEBUG = false
var filelocation: String = ""

let file: NSFileHandle? = NSFileHandle(forReadingAtPath: "hello.swift")

var airportList = Set<Airport>()

proccessCmdLineArgs()

processFile()

while true {
    switch menu() {
    case 1:
        searchDirectFlights()
    case 2:
        searchRoutes()
        //    case 3:
        //        search_circuits()

    default:
        print ("Invalid option!")
    }

}
