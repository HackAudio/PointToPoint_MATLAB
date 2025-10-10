classdef Jh_MG_Drive_B < Circuit 
    
    methods
        function [o] = Jh_MG_Drive_B
            
            o.layout.numNodes = 4;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (3, 0);
            
            R1 = Resistor (100e3, 1, 2);
            R2 = Resistor (220e3, 2, 3);
            R3 = Resistor (6.8e3, 2, 4);
            o.layout.Rs = [R1; R2; R3];

            C1 = Capacitor (470e-12, 2, 3);
            o.layout.Cs = C1;

            OP1 = OPAmp (0, 2, 3);
            o.layout.OPAmps = OP1;

            D1 = Diode (Semiconductor.SILICON,...
               Configuration.MATCHEDPAIR,...
               4, 3);
            o.layout.Ds = D1;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end