import XCTest
@testable import NeuralNetwork

class FeedForwardNetworkTests: XCTestCase {
    private var network = FeedForwardNetwork(inputLayerNeurons: 3, hiddenLayerNeurons: 4, outputLayerNeurons: 1)

    func testNetworkSetup()  {
        XCTAssertEqual(network.inputLayer!.count, 3)
        XCTAssertEqual(network.hiddenLayer!.count, 4)
        XCTAssertEqual(network.outputLayer!.count, 1)
    }

    func testNetoworkSynapses()  {
        let firstInputNeuron = network.inputLayer!.first
        let firstHiddenNeuron = network.hiddenLayer!.first
        XCTAssertEqual(firstInputNeuron!.synapses!.count, 4)
        XCTAssertEqual(firstHiddenNeuron!.synapses!.count, 1)
    }

    func testNetworkInputs()  {
        network.evaluate(inputs:[1.0, 1.0, 1.0])
        network.evaluate(inputs:[0.0, 1.0, 1.0])
        network.evaluate(inputs:[0.0, 0.0, 1.0])
        network.evaluate(inputs:[1.0, 0.0, 1.0])
        XCTAssertNotNil(network.outputLayer!)
    }

    static var allTests : [(String, (FeedForwardNetworkTests) -> () throws -> Void)] {
        return [
            ("testNetworkSetup", testNetworkSetup),
            ("testNetoworkSynapses", testNetoworkSynapses),
            ("testNetworkInputs", testNetworkInputs)
        ]
    }
}
