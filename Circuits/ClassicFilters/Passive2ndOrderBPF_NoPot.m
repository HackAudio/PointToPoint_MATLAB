classdef Passive2ndOrderBPF_NoPot < Circuit 
    
    methods
        function [o] = Passive2ndOrderBPF_NoPot()
            
            o.layout.numNodes = 3;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(3,0);
            %R1 = Resistor(10000,2,0);
            %R2 = Resistor(10000,2,3);
            
            R1 = Resistor(10000,2,0);
            R2 = Resistor(10000,2,3);
            o.layout.Rs = [R1 ; R2];
            
            C1 = Capacitor(15e-9,1,2);
            C2 = Capacitor(560e-12,3,0);
            o.layout.Cs = [C1 ; C2];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end

