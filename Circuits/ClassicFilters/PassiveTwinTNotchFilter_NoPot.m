classdef PassiveTwinTNotchFilter_NoPot < Circuit 
    
    methods
        function [o] = PassiveTwinTNotchFilter_NoPot()
            
            o.layout.numNodes = 4;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            R1 = Resistor(2000,1,2);
            R2 = Resistor(2000,2,4);
            R3 = Resistor(1000,3,0);
            o.layout.Rs = [R1 ; R2; R3];
            
            C1 = Capacitor(79.6e-9,1,3);
            C2 = Capacitor(79.6e-9,3,4);
            C3 = Capacitor(159.2e-9,2,0);
            o.layout.Cs = [C1 ; C2; C3];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end