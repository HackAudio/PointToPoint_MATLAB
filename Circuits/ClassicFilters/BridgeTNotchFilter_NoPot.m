classdef BridgeTNotchFilter_NoPot < Circuit   
    
    methods
        function [o] = BridgeTNotchFilter_NoPot()
            
            o.layout.numNodes = 4;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            R1 = Resistor(10000,1,2);
            R2 = Resistor(10000,2,3);
            o.layout.Rs = [R1 ; R2];
            
            C1 = Capacitor(10.0e-9,1,3);
            C2 = Capacitor(100.0e-9,2,0); 
            o.layout.Cs = [C1 ; C2];
            
             o.layout.OPAmps = OPAmp(3,4,4);
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end