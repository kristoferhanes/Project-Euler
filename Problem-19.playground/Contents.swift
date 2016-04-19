typealias Year = Int

enum Month: Int {
  case Jan
  case Feb
  case Mar
  case Apr
  case May
  case Jun
  case Jul
  case Aug
  case Sep
  case Oct
  case Nov
  case Dec
}

extension Month {

  func numDaysForYear(year: Year) -> Int {
    switch self {
    case .Apr, .Jun, .Sep, .Nov: return 30
    case .Jan, .Mar, .May, .Jul, .Aug, .Oct, .Dec: return 31
    case .Feb: return year.isLeapYear ? 29 : 28
    }
  }

  var lastMonth: Month {
    return self == .Jan ? .Dec : Month(rawValue: rawValue-1)!
  }

  func firstWeekdayForYear(year: Year) -> Weekday {
    struct Memo { static var weekdays: [Int:Weekday] = [:] }
    let key = 13 * rawValue + year
    if let w = Memo.weekdays[key] { return w }

    if self == .Jan { return year.firstWeekday }
    let result = lastMonth.firstWeekdayForYear(year).addDays(lastMonth.numDaysForYear(year))

    Memo.weekdays[key] = result
    return result
  }

}

enum Weekday: Int {
  case Monday
  case Tuesday
  case Wednesday
  case Thursday
  case Friday
  case Saturday
  case Sunday
}

extension Weekday {

  func addDays(n: Int) -> Weekday {
    return Weekday(rawValue: (rawValue + n) % 7)!
  }

  var isSunday: Bool {
    return self == .Sunday
  }

}

extension Year {

  var isLeapYear: Bool {
    return (self % 4 == 0 && (self % 100 != 0 || self % 400 == 0))
  }

  var numberOfDays: Int {
    return isLeapYear ? 366 : 365
  }

  var firstWeekday: Weekday {
    if self == 1900 { return .Monday }
    let lastYear = self - 1
    return lastYear.firstWeekday.addDays(lastYear.numberOfDays)
  }

  var firstWeekdays: [Weekday] {
    return (0..<12).map { Month(rawValue: $0)!.firstWeekdayForYear(self) }
  }

}

func startDays(ys: [Year]) -> [Weekday] {
  return ys.flatMap { $0.firstWeekdays }
}

func sundays(ds: [Weekday]) -> [Weekday] {
  return ds.filter { $0.isSunday }
}

func firstSundaysInYears(ys: [Year]) -> Int {
  return sundays(startDays(ys)).count
}


let years = [Year](1901...2000)


let solution = firstSundaysInYears(years)
solution
