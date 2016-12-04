enum ANSI: UInt8, CustomStringConvertible {

	case reset = 0
    case bold = 1
    case dim = 2
    case italic = 3
    case underline = 4
    case blink = 5
    case swap = 7
	case strikethrough = 9

	case black = 30
	case red
	case green
	case yellow
	case blue
	case magenta
	case cyan
	case white
	case `default` = 39
	case lightBlack = 90
	case lightRed
	case lightGreen
	case lightYellow
	case lightBlue
	case lightMagenta
	case lightCyan
	case lightWhite

    var description: String {
        return "\u{001B}[\(self.rawValue)m"
    }

}
