classdef Sallen_Key_B_Low_2kHz < Circuit 
    
    methods
        function [o] = Sallen_Key_B_Low_2kHz
            
            o.layout.numNodes = 4;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (4, 0);
            
            R1 = Resistor (7.95e3, 1, 2);
            R2 = Resistor (7.95e3, 2, 3);
            o.layout.Rs = [R1; R2];

            C1 = Capacitor (10e-9, 3, 0);
            C2 = Capacitor (10e-9, 2, 4);
            o.layout.Cs = [C1; C2];

            OP1 = OPAmp (3, 4, 4);
            o.layout.OPAmps = OP1;
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end