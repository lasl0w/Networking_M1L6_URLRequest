import UIKit

var greeting = "Hello, playground"

// NETWORKING BASICS

struct Person {
    var name: String
    
    func walk() {
        print("walk walk walk")
    }
}
// Optionals work with structs too
var me:Person? = nil

// Checking for nil before unwrapping and using instance
if me != nil {
    me!.walk()
}

// OPTIONAL CHAINING with a method
me?.walk()  // if me is not nil, call the walk function

// OPTIONAL CHAINING with nil coalescing operator
me?.name ?? "Default Name"  // But we didn't assign it.... weird

// INIT produces an optional URL
let url = URL(string: "https://api.pexels.com/v1/search?query=nature&per_page=1")

let url2:URL? = URL(string: "https://api.pexels.com/v1/search?query=nature&per_page=1")

// either need to say ....
if url != nil {
    // do some things with the URL
}
// OR use optional binding instead.  more elegant
if let actualUrl = url {
    // do some things with the actualURL
}

// OR >>> an even easier way (or just less lines of code)
if let actualUrl2 = URL(string: "https://api.pexels.com/v1/search?query=nature&per_page=1") {
    // do some things with actualUrl2
}

// ERROR HANDLING

func functionThatThrows() throws {
    // if we add the throws keyword
}

// Method 1: handle the error

do {
    try functionThatThrows()
}
catch {
    print("Encountered an error")
}

// Method 2: ignore the error
try? functionThatThrows()
// if there is an error, i don't want to know about it!

// Method 3: Crash
try! functionThatThrows()
// wouldn't really ever do this.  Bad form!
