//
//  main.swift
//  Flights
//
//  Created by Raul Ferreira on 4/8/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

print("Hello, World!")

let stdin = StreamScanner( source: NSFileHandle.fileHandleWithStandardInput(), delimiters: NSCharacterSet(charactersInString: ".") )

var linesList = [String]()

//var index = 0
for line in stdin
{
    //    print(" \(index) : \(line)")
    //    index+=1
    linesList.append(line)
}

for line in linesList {

    print("----here is a line----")
    //print(line)

    let newstr = line.stringByReplacingOccurrencesOfString("timetable(", withString: "")
    let newnewstr = line.stringByReplacingOccurrencesOfString("\n",withString: "")

    let delimiter = ","
    let token = newnewstr.componentsSeparatedByString(delimiter)
    print ("Source: \(token[0])" )
    print ("Destination: \(token[1])" )
    print ("LOL2: \(token[2])" )

    print("----there it was------")

}