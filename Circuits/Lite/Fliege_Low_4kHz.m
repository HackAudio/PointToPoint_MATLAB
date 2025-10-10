classdef Fliege_Low_4kHz < Circuit 
    
    methods
        function [o] = Fliege_Low_4kHz
            
            o.layout.numNodes = 6;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);
            
            R1 = Resistor (3.99e3, 1, 2);
            R2 = Resistor (3.99e3, 3, 4);
            R3 = Resistor (2.82e3, 2, 3);
            R4 = Resistor (10e3, 5, 6);
            R5 = Resistor (10e3, 6, 0);
            o.layout.Rs = [R1; R2; R3; R4; R5];

            C1 = Capacitor (10e-9, 2, 3);
            C2 = Capacitor (10e-9, 4, 5);
            o.layout.Cs = [C1; C2];

            OP1 = OPAmp (2, 4, 5);
            OP2 = OPAmp (6, 4, 3);
            o.layout.OPAmps = [OP1; OP2];
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end