//
//  main.swift
//  Flights
//
//  Created by Raul Ferreira on 4/8/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation


//let teste = "16:10"
//let dateFormatter = NSDateFormatter()
//dateFormatter.dateFormat = "HH:mm"
//dateFormatter.dateFromString(teste)
//
//print(teste)



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

let result = findDirectFlight("zurich", Destination: "ljubljana")

print("There are flights available in \(result.count) different days \nThe days are: \(result)")