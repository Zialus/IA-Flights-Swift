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
