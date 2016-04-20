//
//  Auxiliary.swift
//  Flights
//
//  Created by Raul Ferreira on 4/13/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

func timeToMins(timeString: String) -> (Int) {

    let delimiter = ":"
    let parts = timeString.componentsSeparatedByString(delimiter)

    let hours = Int(parts[0])!
    let mins = Int(parts[1])!

    return (hours * 60 + mins)

}

func minsToTime(timeInt: Int) -> (String) {

    let hours = timeInt / 60
    let mins = timeInt % 60
    let delimiter = ":"

    return "\(hours)\(delimiter)\(mins)"

}

func printdebug(string: String) -> () {

    if DEBUG == true{
        print(string)
    }

}