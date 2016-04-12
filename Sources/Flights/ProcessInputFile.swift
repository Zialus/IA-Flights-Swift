//
//  ProcessInputFile.swift
//  Flights
//
//  Created by Raul Ferreira on 4/12/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

func processFile () {

    let fileContent = try? NSString(contentsOfFile: filelocation, encoding: NSUTF8StringEncoding)

    //print(fileContent)

    if fileContent == nil {
        print("Something went wrong when opening the file: \(filelocation)")
        exit(1)
    } else {

        let delimiter = "."
        let linesList = fileContent!.componentsSeparatedByString(delimiter)

        for line in linesList {

            print("----here is a line----")
            //print(line)

            let newline1 = line.stringByReplacingOccurrencesOfString("timetable(", withString: "")
            let newline2 = newline1.stringByReplacingOccurrencesOfString("\n", withString: "")
            let newline3 = newline2.stringByReplacingOccurrencesOfString("\t", withString: "")
            let newline4 = newline3.stringByReplacingOccurrencesOfString(" ", withString: "")


            if let comma_range = newline4.rangeOfString(","),
                let left_bracket = newline4.rangeOfString("[") {
                let flightSource = newline4[newline4.startIndex..<comma_range.startIndex]
                let secondPart = newline4[comma_range.startIndex..<left_bracket.startIndex]
                let thirdPart = newline4[left_bracket.startIndex..<newline4.endIndex]

                //-------------At this point i know the source airport-----------⁄
                print("Source:")
                print(flightSource)
                let airport_tmp = Airport(city: flightSource)


                if !airportList.contains(airport_tmp){
                    airportList.insert(airport_tmp)
                }


                let flightDestination = secondPart[secondPart.startIndex.advancedBy(1)..<secondPart.endIndex.advancedBy(-1)]
                print("Destination:")
                print(flightDestination)

                let thirdPartFinal = thirdPart[ thirdPart.startIndex.advancedBy(1)..<thirdPart.endIndex.advancedBy(-2)   ]


                let evenmorefinalthirdpart = thirdPartFinal.stringByReplacingOccurrencesOfString("],",withString: "];")
                let moreevenmorefinalthirdpart = evenmorefinalthirdpart.stringByReplacingOccurrencesOfString("alldays,",withString: "alldays;")


                        print("Third:")
                        print(moreevenmorefinalthirdpart)


                let delimiter = ";"
                let listOfInfos = moreevenmorefinalthirdpart.componentsSeparatedByString(delimiter)

                for wholeInfo in listOfInfos {

                    print("-----: ola: -----")

                    let delimiter = "/"
                    let infos = wholeInfo.componentsSeparatedByString(delimiter)

                    let tmp_timeLeaving = infos[0]
                    let tmp_timeArrival = infos[1]
                    let tmp_code = infos[2]
                    let _tmp_days = infos[3]

                    var tmp_days = [String:Bool]()

                    tmp_days["mo"] = false
                    tmp_days["tu"] = false
                    tmp_days["we"] = false
                    tmp_days["th"] = false
                    tmp_days["fr"] = false
                    tmp_days["sa"] = false
                    tmp_days["su"] = false

                    if _tmp_days == "alldays"{

                        tmp_days["mo"] = true
                        tmp_days["tu"] = true
                        tmp_days["we"] = true
                        tmp_days["th"] = true
                        tmp_days["fr"] = true
                        tmp_days["sa"] = true
                        tmp_days["su"] = true
                    }

                    else {


                        let more_tmp_days = _tmp_days.stringByReplacingOccurrencesOfString("[", withString: "")
                        let more_more_tmp_days = more_tmp_days.stringByReplacingOccurrencesOfString("]", withString: "")


                        let delimiter = ","
                        let days_info = more_more_tmp_days.componentsSeparatedByString(delimiter)


                        for lol in days_info{
                            tmp_days[lol]=true
                        }

                    }

                    let flight = FlightInfo( code: tmp_code, destination: flightDestination, timeLeaving: tmp_timeLeaving, timeArrival: tmp_timeArrival, days: tmp_days)

                    
                    let tmp_airport_hack = Airport(city: flightSource)
                    let indexAirport = airportList.indexOf(tmp_airport_hack)
                    airportList[indexAirport!].flights.append(flight)
                    
                    //                for info in infos {
                    //                    print("\(info)")
                    //
                    //                }
                    
                    print("-----: adeus: -----")
                    
                    
                    
                    
                }
                
            }
            
            
        }
        
        
        print("PROCESSED EVERYTHING")
        
        for crap in airportList{
            print("-----$$$$START$$$$----")
            print(crap.city)
            print("numero")
            print(crap.flights.count)
            print("voos")
            print(crap.flights)
            print("-----$$$$FIM$$$$----")
        }

        
    }
    
}