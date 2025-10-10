classdef Diode_Si_Hard_Clipper_Static < Circuit 
    
    methods
        function [o] = Diode_Si_Hard_Clipper_Static
            
            o.layout.numNodes = 2;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (2, 0);

            R1 = Resistor (10e3, 1, 2);
            o.layout.Rs = R1;
    
            D1 = Diode (Semiconductor.SILICON,...
               Configuration.MATCHEDPAIR,...
               2, 0);

            o.layout.Ds = D1;

            o.circuit = CircuitModel (o.layout);
        end
    end
end