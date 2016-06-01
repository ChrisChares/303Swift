import Foundation

/*
	Constants
 */
 typealias JSON = [String: AnyObject]
 let encoding = NSUTF8StringEncoding
 let oneMonth = 60 * 60 * 24 * 30 // One month in seconds
 /*
	Formatters
 */
 let nf = NSNumberFormatter()
 let df = NSDateFormatter()
 df.dateFormat = "yyyy-MM-dd HH:mm:ss"
 /*
	File Read
 */
 let location = NSString(string:"./crime.csv").stringByExpandingTildeInPath
 let fileContent = try! NSString(contentsOfFile: location, encoding: encoding)
 
 var crimes = [JSON]()
 /*
	Line Parsing
 */
 for (i, line) in fileContent.componentsSeparatedByString("\n").enumerate() {
	// ignore the schema line of the csv
	guard i != 0 else { continue }
 
	// ignore empty lines
	guard line.characters.count != 0 else { continue }
	guard line != "\n" else { continue }
 
	// every value from the line
	let values = line.componentsSeparatedByString(",")
 
	// toss any lines without our required fields
	guard values.count >= 13 else { continue }
 
	let title = values[4]
 
	// toss any traffic crimes
	guard !title.containsString("traf") else { continue }
 
	// toss any crimes older than one month
	guard let date = df.dateFromString(values[6]) where date.timeIntervalSinceNow > Double(-1 * oneMonth) else { continue }
 
	// toss any crimes without lat/lon
	guard let lat = nf.numberFromString(values[13]) else { continue }
	guard let lon = nf.numberFromString(values[12]) else { continue }
 
	let crime = [
	"title": title,
	"lat": lat,
	"lon": lon
	]
	crimes.append(crime)
 }
 /*
    Write JSON
 */
 let jsonData = try! NSJSONSerialization.dataWithJSONObject(crimes, options: [])
 let jsonString = NSString(data: jsonData, encoding: encoding)!
 try! jsonString.writeToFile("./data.json", atomically: false, encoding: encoding)
