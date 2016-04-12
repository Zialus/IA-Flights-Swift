//
//  main.swift
//  Flights
//
//  Created by Raul Ferreira on 4/8/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

// Store debug information that will be given by cmdline args
var DEBUG = false
var FULLDEBUG = false
var filelocation: String = ""

let file: NSFileHandle? = NSFileHandle(forReadingAtPath: "hello.swift")

proccessCmdLineArgs()

let fileContent = try? NSString(contentsOfFile: filelocation, encoding: NSUTF8StringEncoding)

//print(fileContent)

if fileContent == nil {
    print("Something went wrong")
    exit(1)
} else {

    let delimiter = "."
    let linesList = fileContent!.componentsSeparatedByString(delimiter)

    var airpoirtList = [Airport]()

    for line in linesList {

        print("----here is a line----")
        //print(line)

        let newline1 = line.stringByReplacingOccurrencesOfString("timetable(", withString: "")
        let newline2 = newline1.stringByReplacingOccurrencesOfString("\n", withString: "")
        let newline3 = newline2.stringByReplacingOccurrencesOfString("\t", withString: "")
        let newline4 = newline3.stringByReplacingOccurrencesOfString(" ", withString: "")


        if let comma_range = newline4.rangeOfString(","),
            let left_bracket = newline4.rangeOfString("[") {
            let firstPart = newline4[newline4.startIndex..<comma_range.startIndex]
            let secondPart = newline4[comma_range.startIndex..<left_bracket.startIndex]
            let thirdPart = newline4[left_bracket.startIndex..<newline4.endIndex]

            //-------------At this point i know the source airport-----------⁄
            print("Source:")
            print(firstPart)
            let airport_tmp = Airport(city: firstPart)
            airpoirtList.append(airport_tmp)


            let secondPartFinal = secondPart[secondPart.startIndex.advancedBy(1)..<secondPart.endIndex.advancedBy(-1)]
            print("Destination:")
            print(secondPartFinal)

            let thirdPartFinal = thirdPart[ thirdPart.startIndex.advancedBy(1)..<thirdPart.endIndex.advancedBy(-2)   ]


            let evenmorefinalthirdpart = thirdPartFinal.stringByReplacingOccurrencesOfString("],",withString: "];")
            let moreevenmorefinalthirdpart = evenmorefinalthirdpart.stringByReplacingOccurrencesOfString("alldays,",withString: "alldays;")


            //        print("Third:")
            //        print(moreevenmorefinalthirdpart)


            let delimiter = ";"
            let tokens = moreevenmorefinalthirdpart.componentsSeparatedByString(delimiter)

            for t in tokens {

                //            print("ola: \(t)")

                let delimiter = "/"
                let inside_tokens = t.componentsSeparatedByString(delimiter)

                for inside_t in inside_tokens {
                    print("l: \(inside_t)")

                }

//                let flight = FlightInfo( code: String, destination: String, timeLeaving: Int, timeArrival: Int, days: [String])


            }

        }


    }


}
