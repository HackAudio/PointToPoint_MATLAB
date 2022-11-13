classdef SeriesPosClipper_NegBiasV < Circuit
    methods
        function [o] = SeriesPosClipper_NegBiasV()
            
            o.layout.numNodes = 3;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(2,0);
            o.layout.Vs = VoltageSource(-.5,3); % [0:1]

            R = Resistor(10e3,2,3);
            o.layout.Rs = R;
            
            D1 = Diode(Semiconductor.GERMANIUM,Configuration.SINGLE,2,1);

            o.layout.Ds = D1;
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end