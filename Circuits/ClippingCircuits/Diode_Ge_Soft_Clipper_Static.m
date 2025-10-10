classdef Diode_Ge_Soft_Clipper_Static < Circuit 
    
    methods
        function [o] = Diode_Ge_Soft_Clipper_Static
            
            o.layout.numNodes = 4;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (4, 0);

            R1 = Resistor (10e3, 2, 0);
            R2 = Resistor (100e3, 2, 3);
            R3 = Resistor (25e3, 3, 4);
            R4 = Resistor (100e3, 4, 0);
            o.layout.Rs = [R1; R2; R3; R4];

            C1 = Capacitor (1e-9, 2, 3);
            o.layout.Cs = C1;

            OP1 = OPAmp (1, 2, 3);
            o.layout.OPAmps = OP1;
    
            D1 = Diode (Semiconductor.GERMANIUM,...
               Configuration.MATCHEDPAIR,...
               2, 3);

            o.layout.Ds = D1;

            o.circuit = CircuitModel (o.layout);
        end
    end
end