enum Month: Int {
  case january
  case february
  case march
  case april
  case may
  case june
  case july
  case august
  case september
  case october
  case november
  case december
}

extension Month {

  func days(in year: Year) -> Int {
    switch self {
    case .january, .march, .may, .july:        return 31
    case .august, .october, .december:         return 31
    case .april, .june, .september, .november: return 30
    case .february where year.isLeapYear:      return 29
    case .february:                            return 28
    }
  }

  var previous: Month {
    return self == .january ? .december : Month(rawValue: rawValue-1)!
  }

  func firstWeekday(in year: Year) -> Weekday {
    struct Memo { static var weekdays: [Int:Weekday] = [:] }
    let key = 13 * rawValue + year.rawValue
    if let w = Memo.weekdays[key] { return w }

    if self == .january { return year.firstDay }
    let result = previous.firstWeekday(in: year).adding(days: previous.days(in: year))

    Memo.weekdays[key] = result
    return result
  }
  
}

enum Weekday: Int {
  case monday
  case tuesday
  case wednesday
  case thursday
  case friday
  case saturday
  case sunday
}

extension Weekday {

  func adding(days n: Int) -> Weekday {
    return Weekday(rawValue: (rawValue + n) % 7)!
  }

  var isSunday: Bool {
    return self == .sunday
  }

}

struct Year {
  var rawValue: Int
}

extension Year {

  var isLeapYear: Bool {
    return (rawValue % 4 == 0 && (rawValue % 100 != 0 || rawValue % 400 == 0))
  }

  var days: Int {
    return isLeapYear ? 366 : 365
  }

  var firstDay: Weekday {
    if rawValue == 1900 { return .monday }
    let lastYear = Year(rawValue: rawValue - 1)
    return lastYear.firstDay.adding(days: lastYear.days)
  }

  var firstDaysOfMonths: [Weekday] {
    return (0..<12).flatMap { Month(rawValue: $0)?.firstWeekday(in: self) }
  }

}

extension Sequence where Iterator.Element == Year {
  var firstSundays: Int {
    return flatMap { $0.firstDaysOfMonths }.filter { $0.isSunday }.count
  }
}

let years = (1901...2000).map(Year.init)

let solution = years.firstSundays
solution

