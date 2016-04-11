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
            break
        case "fulldebug":
            print("full debug mode is ON!!!")
            DEBUG=true
            FULLDEBUG=true
            break
        default:
            print("LOLWUT!? \"\(onlyArg)\": is an unrecognized argument")
            exit(1)
        }

    } else if Process.arguments.count == 2 {
        print("Welcome to a silly little app that does stuff!\n")

        print("All debug functionality is turned OFF")
        filelocation = Process.arguments[1]
    }

}
