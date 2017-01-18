import XCTest
@testable import NeuralNetwork

class NeuralNetworkTests: XCTestCase {
    private var neuron = Neuron()

    override func setUp() {
        neuron.potential = 0.5
        neuron.threshold = 0.75
    }

    func testNeuron()  {
        XCTAssertNotNil(neuron)
    }

    func testNeuronStimulation()  {
        let connectedNeuron = Neuron(initialPotential: 0.0, initialThreshold: 0.85)
        neuron.synapses = [connectedNeuron]
        neuron.stimulate(signal: 0.3)
        XCTAssertEqual(connectedNeuron.potential, 0.8)
    }

    func testNeuronReset()  {
        neuron.potential = 0.5
        neuron.reset()
        XCTAssertEqual(neuron.potential, 0.0)
    }

    static var allTests : [(String, (NeuralNetworkTests) -> () throws -> Void)] {
        return [
            ("testNeuron", testNeuron),
            ("testNeuronStimulation", testNeuronStimulation),
            ("testNeuronReset", testNeuronReset)
        ]
    }
}
