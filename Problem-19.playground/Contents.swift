
import UIKit

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

extension Month: CustomStringConvertible {
  var description: String {
    switch self {
    case .Jan: return "January"
    case .Feb: return "Febuary"
    case .Mar: return "March"
    case .Apr: return "April"
    case .May: return "May"
    case .Jun: return "June"
    case .Jul: return "July"
    case .Aug: return "August"
    case .Sep: return "September"
    case .Oct: return "October"
    case .Nov: return "November"
    case .Dec: return "December"
    }
  }
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
    struct Memo { static var weekdays = [Int:Weekday]() }

    let key = 13 * rawValue + year
    if let w = Memo.weekdays[key] { return w }
    if self == .Jan { return year.firstWeekday }
    let result = lastMonth.firstWeekdayForYear(year)
      .addDays(lastMonth.numDaysForYear(year))
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

extension Weekday: CustomStringConvertible {
  var description: String {
    switch self {
    case .Monday: return "Monday"
    case .Tuesday: return "Tuesday"
    case .Wednesday: return "Wednesday"
    case .Thursday: return "Thursday"
    case .Friday: return "Friday"
    case .Saturday: return "Saturday"
    case .Sunday: return "Sunday"
    }
  }
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
    struct Memo { static var firstDay = [Year:Weekday]() }

    if let d = Memo.firstDay[self] { return d }
    if self == 1900 { return .Monday }
    let lastYear = self - 1
    let day = lastYear.firstWeekday.addDays(lastYear.numberOfDays)
    Memo.firstDay[self] = day
    return day
  }

  var firstWeekdays: [Weekday] {
    var result = [Weekday]()
    for m in 0..<12 {
      let month = Month(rawValue: m)!
      result.append(month.firstWeekdayForYear(self))
    }
    return result
  }
}

func startDays(ys: [Year]) -> [Weekday] {
  return ys.flatMap { $0.firstWeekdays }
}

func firstSundays(ds: [Weekday]) -> [Weekday] {
  return ds.filter { $0.isSunday }
}

func firstSundaysInYears(ys: [Year]) -> Int {
  return firstSundays(startDays(ys)).count
}


let years = [Year](1901...2000)


let solution = firstSundaysInYears(years)
print(solution)









