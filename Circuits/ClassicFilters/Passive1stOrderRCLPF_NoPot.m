classdef Passive1stOrderRCLPF_NoPot < Circuit 
    
    methods
        function [o] = Passive1stOrderRCLPF_NoPot()
            
            o.layout.numNodes = 2;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(2,0);
            R = Resistor(10000,1,2); 
            o.layout.Rs = R;
            
            C = Capacitor(47e-9,2,0);
            o.layout.Cs = C
            
            o.circuit = CircuitModel(o.layout);
        end
        
    end
end