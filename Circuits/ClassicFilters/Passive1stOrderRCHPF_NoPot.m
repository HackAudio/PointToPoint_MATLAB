classdef Passive1stOrderRCHPF_NoPot < Circuit 
    
    methods
        function [o] = Passive1stOrderRCHPF_NoPot()
            
            o.layout.numNodes = 2;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(2,0);
            R = Resistor(47000,2,0);
            o.layout.Rs = R;
            C = Capacitor(47e-9,1,2);
            o.layout.Cs = C;
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end
