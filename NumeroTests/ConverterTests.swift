/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import XCTest
@testable import Numero

class ConverterTests: XCTestCase {
    var converter: Converter!
    
    override func setUp() {
        super.setUp()
        converter = Converter()
    }
    
    override func tearDown() {
        super.tearDown()
        converter = nil
    }
    
    func testConversionForOne() {
        let result = converter.convert(1)
        XCTAssertEqual(result, "I", "Conversion for 1 is incorrect")
    }
}

class ShuffleTests: XCTestCase {
    struct MySequence: Sequence, IteratorProtocol {
        typealias Element = Int
        
        var current = 1
        
        mutating func next() -> Int? {
            defer {
                current *= 2
            }
            
            return current
        }
    }
    
    var sequence: AnySequence<Int>?
    var arr: [Int] = [0,1,2,3,4,5,6,7]
    override func setUp() {
        super.setUp()
        
        ({
            let sequence = MySequence(current: 1)
            
            var i = 0
            for number in sequence {
                i += 1
                if i == 10 { break }
                
                print(number)
            }
        }())
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShuffle() {
        var result = arr.myShuffled()
        XCTAssertNotEqual(result, arr)
        
        arr = []
        result = arr.myShuffled()
        print("arr : ", arr)
        print("result : ", result)
        XCTAssertEqual(result, arr)
    }
    
}

//import XCTest
//@testable import Numero
//
//class ConverterTests: XCTestCase {
//    var converter: Converter!
//
//    override func setUp() {
//        super.setUp()
//        converter = Converter()
//    }
//
//    override func tearDown() {
//        converter = nil
//        super.tearDown()
//    }
//
//    func testConversionForOne() {
//        let result = converter.convert(1)
//        XCTAssertEqual(result, "I", "Conversion for 1 is incorrect")
//    }
//
//
//}
//
