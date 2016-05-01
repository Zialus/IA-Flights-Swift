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

func printdebug(string: Any) -> () {
    if DEBUG == true {
        print(string)
    }
}

func printfulldebug(string: Any) -> () {
    if FULLDEBUG == true {
        print(string)
    }
}

func nextDay(day: String) -> (String) {

    let nextday: String

    switch day {
    case "mo":
        nextday = "tu"
    case "tu":
        nextday = "we"
    case "we":
        nextday = "th"
    case "th":
        nextday = "fr"
    case "fr":
        nextday = "sa"
    case "sa":
        nextday = "su"
    case "su":
        nextday = "mo"
    default:
        nextday = "WTF!?"
    }

    return nextday

}

func listOfDaysPrettyPrinting(listOfDays: Set<String>) -> () {

    for day in listOfDays {
        switch day {
        case "mo":
            print("Monday")
        case "tu":
            print("Tuesday")
        case "we":
            print("Wednesday")
        case "th":
            print("Thursday")
        case "fr":
            print("Friday")
        case "sa":
            print("Saturday")
        case "su":
            print("Sunday")
        default:
            print("WTF!?")
        }
    }

}

func dayPrettyPrinting(day: String) -> (String) {

    switch day {
    case "mo":
        return "Monday"
    case "tu":
        return "Tuesday"
    case "we":
        return "Wednesday"
    case "th":
        return "Thursday"
    case "fr":
        return "Friday"
    case "sa":
        return "Saturday"
    case "su":
        return "Sunday"
    default:
        return "WTF!?"
    }

}


//--------------Code that allows for Array permutations------------//
extension Array {
    func decompose() -> (Generator.Element, [Generator.Element])? {
        guard let x = first else { return nil }
        return (x, Array(self[1..<count]))
    }
}

func between<T>(x: T, _ ys: [T]) -> [[T]] {
    guard let (head, tail) = ys.decompose() else { return [[x]] }
    return [[x] + ys] + between(x, tail).map { [head] + $0 }
}

func permutations<T>(xs: [T]) -> [[T]] {
    guard let (head, tail) = xs.decompose() else { return [[]] }
    return permutations(tail).flatMap { between(head, $0) }
}
//-----------------------------------------------------------------//
