import Foundation

func timeToMins(_ timeString: String) -> (Int) {

    let delimiter = ":"
    let parts = timeString.components(separatedBy: delimiter)

    let hours = Int(parts[0])!
    let mins = Int(parts[1])!

    return (hours * 60 + mins)

}

func minsToTime(_ timeInt: Int) -> (String) {

    let hours = timeInt / 60
    let mins = timeInt % 60
    let delimiter = ":"

    return "\(hours)\(delimiter)\(mins)"

}

func printdebug(_ string: Any) -> () {
    if DEBUG == true {
        print(string)
    }
}

func printfulldebug(_ string: Any) -> () {
    if FULLDEBUG == true {
        print(string)
    }
}

func nextDay(_ day: String) -> (String) {

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

func listOfDaysPrettyPrinting(_ listOfDays: Set<String>) -> () {

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

func dayPrettyPrinting(_ day: String) -> (String) {

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
    func decompose() -> (Iterator.Element, [Iterator.Element])? {
        guard let x = first else { return nil }
        return (x, Array(self[1..<count]))
    }
}

func between<T>(_ x: T, _ ys: [T]) -> [[T]] {
    guard let (head, tail) = ys.decompose() else { return [[x]] }
    return [[x] + ys] + between(x, tail).map { [head] + $0 }
}

func permutations<T>(_ xs: [T]) -> [[T]] {
    guard let (head, tail) = xs.decompose() else { return [[]] }
    return permutations(tail).flatMap { between(head, $0) }
}
//-----------------------------------------------------------------//
