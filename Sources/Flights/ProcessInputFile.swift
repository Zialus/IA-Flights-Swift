import Foundation
import Rainbow

func processFile () {

    print("Trying to open the file: \(filelocation) ... ", terminator:"")

    let fileContent = try? NSString(contentsOfFile: filelocation, encoding: String.Encoding.utf8.rawValue)

    if fileContent == nil {
        print("Something went wrong while trying to open that file!".red)
        exit(1)
    } else {

        print("File opened successfuly!".lightGreen)

        printfulldebug("\n\(ANSI.cyan)######BEGINNING OF FILE CONTENT######\(ANSI.reset)")
        printfulldebug(fileContent!)
        printfulldebug("\(ANSI.cyan)######END OF FILE CONTENT######\(ANSI.reset)\n")

        let delimiter = "."
        let linesList = fileContent!.components(separatedBy: delimiter)

        // Each line of the linesList has a source and destination airport and flight info
        for line in linesList {

            printfulldebug("\(ANSI.cyan)~~~~~~~~~~~~~~~~BEGINNING OF LINE~~~~~~~~~~~~~~~~\(ANSI.reset)")

            printfulldebug("\(ANSI.yellow)$$$$$$--FULL LINE--$$$$$$$\(ANSI.reset)")
            printfulldebug(line)
            printfulldebug("\(ANSI.yellow)$$$$$$--END OF IT--$$$$$$$\(ANSI.reset)")

            // CLEAN THE STRING
            let newline1 = line.replacingOccurrences(of: "timetable(", with: "")
            let newline2 = newline1.replacingOccurrences(of: "\n", with: "")
            let newline3 = newline2.replacingOccurrences(of: "\t", with: "")
            let newline4 = newline3.replacingOccurrences(of: " ", with: "")

            if let comma_range = newline4.range(of: ","),
                let left_bracket = newline4.range(of: "[") {

                let flightSource = String(newline4[newline4.startIndex..<comma_range.lowerBound])
                let secondPart = String(newline4[comma_range.lowerBound..<left_bracket.lowerBound])
                let thirdPart = String(newline4[left_bracket.lowerBound..<newline4.endIndex])

                printfulldebug("Source: |\(flightSource)|")

                let airport_tmp = Airport(city: flightSource)

                if !airportList.contains(airport_tmp) {
                    airportList.insert(airport_tmp)
                }

                let flightDestination = String(secondPart[secondPart.index(secondPart.startIndex, offsetBy: 1)..<secondPart.index(secondPart.endIndex, offsetBy: -1)])

                printfulldebug("Destination: |\(flightDestination)|")

                let thirdPartv2 = thirdPart[thirdPart.index(thirdPart.startIndex, offsetBy: 1)..<thirdPart.index(thirdPart.endIndex, offsetBy: -2)]

                let thirdPartv3 = String(thirdPartv2).replacingOccurrences(of: "],", with: "];")

                let thirdPartFinal = thirdPartv3.replacingOccurrences(of: "alldays,", with: "alldays;")

                printfulldebug("Third: |\(thirdPartFinal)|")

                let delimiter = ";"
                let listOfInfos = thirdPartFinal.components(separatedBy: delimiter)

                for wholeInfo in listOfInfos {

                    printfulldebug("\(ANSI.magenta)--------:START:-------\(ANSI.reset)")

                    let delimiter = "/"
                    let infos = wholeInfo.components(separatedBy: delimiter)

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

                    if _tmp_days == "alldays" {
                        tmp_days["mo"] = true
                        tmp_days["tu"] = true
                        tmp_days["we"] = true
                        tmp_days["th"] = true
                        tmp_days["fr"] = true
                        tmp_days["sa"] = true
                        tmp_days["su"] = true
                    } else {

                        let more_tmp_days = _tmp_days.replacingOccurrences(of: "[", with: "")
                        let more_more_tmp_days = more_tmp_days.replacingOccurrences(of: "]", with: "")

                        let delimiter = ","
                        let days_info = more_more_tmp_days.components(separatedBy: delimiter)

                        for lol in days_info {
                            tmp_days[lol]=true
                        }

                    }

                    let flight = FlightInfo(code: tmp_code, destination: flightDestination, timeLeaving: tmp_timeLeaving, timeArrival: tmp_timeArrival, days: tmp_days)

                    let tmp_airport_hack = Airport(city: flightSource)
                    let indexAirport = airportList.index(of: tmp_airport_hack)
                    airportList[indexAirport!].flights.append(flight)

                    for info in infos {
                        printfulldebug("\(info)")

                    }

                    printfulldebug("\(ANSI.magenta)--------:OVER:--------\(ANSI.reset)")

                }

            }

            printfulldebug("\(ANSI.cyan)~~~~~~~~~~~~~~~~END OF LINE~~~~~~~~~~~~~~~~~~~~~~\(ANSI.reset)")
        }

        printdebug(ANSI.lightGreen)
        printdebug("/----------------------------------------------------------------------\\")
        printdebug("|-------EVERYTHING HAS BEEN PROCESSED!! HERE IS THE FINAL RESULT-------|")
        printdebug("\\----------------------------------------------------------------------/")
        printdebug(ANSI.reset)

        printdebug("The Database has \(airportList.count) Airports, and here they are: ")
        printdebug("")

        for (index, airpoirt) in airportList.enumerated() {
            printdebug("Airport number \(index+1): \(airpoirt.city) has \(airpoirt.flights.count) flights ")
            printdebug("----------------------------------------------------------------")
            printdebug(airpoirt.flights)
            printdebug("----------------------------------------------------------------")
            printdebug("")
        }

    }

}
