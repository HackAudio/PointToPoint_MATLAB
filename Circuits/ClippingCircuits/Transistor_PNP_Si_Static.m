classdef Transistor_PNP_Si_Static < Circuit 
    
    methods
        function [o] = Transistor_PNP_Si_Static
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (4, 0);
            o.layout.Vs = VoltageSource (9, 5);
            
            R1 = Resistor (1e3, 1, 2);
            R2 = Resistor (15e3, 4, 0);
            R3 = Resistor (100e3, 3, 5);
            o.layout.Rs = [R1; R2; R3];

            BJT1 = BJT(Doping.PNP,...
                 Semiconductor.SILICON,...
                 2, 4, 3);
            o.layout.BJTs = BJT1;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end