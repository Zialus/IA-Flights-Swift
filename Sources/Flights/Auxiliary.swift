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
        nextday = "YOU SHOULDN'T DO THAT"
    }

    return nextday

}




// Code that allows for Array permutations

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

// Makes class Airport Equatable
func == (lhs: Airport, rhs: Airport) -> Bool {
    return lhs.city == rhs.city
}


extension String {
    public func leftpad (length: Int, character: Character = " ") -> String {

        var outString: String = self

        let extraLength = length - outString.characters.count

        var i = 0
        while (i < extraLength) {
            outString.insert(character, atIndex: outString.startIndex)
            i += 1
        }

        return outString
    }
}
