classdef MatchedDiodeClipper < Circuit
    methods
        function [o] = MatchedDiodeClipper()
            
            o.layout.numNodes = 2;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(2,0);
            R = Resistor(10e3,1,2);
            o.layout.Rs = R;
            
            D1 = Diode(Semiconductor.GERMANIUM,Configuration.MATCHEDPAIR,2,0);

            o.layout.Ds = D1;
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end