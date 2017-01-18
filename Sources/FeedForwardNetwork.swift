class FeedForwardNetwork {
    var inputLayer: [Neuron]?
    var hiddenLayer: [Neuron]?
    var outputLayer: [Neuron]?

    init () {}
    
    init (inputLayerNeurons: Int, hiddenLayerNeurons: Int, outputLayerNeurons: Int) {
        initialiseInputLayer(inputLayerNeurons: inputLayerNeurons)
        initialiseHiddenLayer(hiddenLayerNeurons: hiddenLayerNeurons)
        initialiseOutputLayer(outputLayerNeurons: outputLayerNeurons)
        connectSynapses()
    }

    func initialiseInputLayer(inputLayerNeurons: Int) {
        inputLayer = [Neuron]()
        for _ in 1...inputLayerNeurons {
            inputLayer!.append(Neuron(initialPotential: 0.0, initialThreshold: 1.0))
        }
    }

    func initialiseHiddenLayer(hiddenLayerNeurons: Int) {
        hiddenLayer = [Neuron]()
        for _ in 1...hiddenLayerNeurons {
            hiddenLayer!.append(Neuron(initialPotential: 0.0, initialThreshold: 1.0))
        }
    }

    func initialiseOutputLayer(outputLayerNeurons: Int) {
        outputLayer = [Neuron]()
        for _ in 1...outputLayerNeurons {
            outputLayer!.append(Neuron(initialPotential: 0.0, initialThreshold: 1.0))
        }
    }

    func connectSynapses() {
        connectInputLayerToHiddenLayer()
        connectHiddenLayerToOutputLayer()
    }

    func connectInputLayerToHiddenLayer() {
        for neuron in inputLayer ?? [] { 
            neuron.synapses = hiddenLayer
        }
    }

    func connectHiddenLayerToOutputLayer() {
        for neuron in hiddenLayer ?? [] { 
            neuron.synapses = outputLayer
        }
    }

    func evaluate(inputs:[Float]) {
        if inputs.count == inputLayer!.count {
            for i in 0..<inputs.count {
                inputLayer![i].stimulate(signal: inputs[i])
            }
        }
    }
}