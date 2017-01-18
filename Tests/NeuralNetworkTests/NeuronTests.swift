import XCTest
@testable import NeuralNetwork

class NeuralNetworkTests: XCTestCase {
    
    func testNeuron()  {
        let n = Neuron()
        XCTAssertNotNil(n)
    }

    static var allTests : [(String, (NeuralNetworkTests) -> () throws -> Void)] {
        return [
            ("testNeuron", testNeuron)
        ]
    }
}
