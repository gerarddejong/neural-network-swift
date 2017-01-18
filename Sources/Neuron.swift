class Neuron {
    var synapses: [Neuron]?
    var potential: Float = 0.0
    var threshold: Float = 0.0

    init () {}

    init (initialPotential: Float, initialThreshold: Float) {
        potential = initialPotential
        threshold = initialThreshold
    }

    func stimulate(signal: Float) {
        potential += signal
        if(potential >= threshold) {
            self.fire()
        }
    }

    func fire() {
        for neuron in synapses ?? [] { 
            neuron.stimulate(signal: potential)
        }
        self.reset()
    }

    func reset() {
        potential = 0.0
    }
}