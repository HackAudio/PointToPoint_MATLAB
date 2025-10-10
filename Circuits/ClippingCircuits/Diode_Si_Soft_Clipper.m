classdef Diode_Si_Soft_Clipper < Circuit 
    
    methods
        function [o] = Diode_Si_Soft_Clipper
            
            o.layout.numNodes = 3;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (3, 0);

            R1 = Resistor (10e3, 2, 0);
            R2 = Resistor (100e3, 2, 3);
            o.layout.Rs = [R1; R2];

            C1 = Capacitor (1e-9, 2, 3);
            o.layout.Cs = C1;
            
            OP1 = OPAmp (1, 2, 3);
            o.layout.OPAmps = OP1;
    
            D1 = Diode (Semiconductor.SILICON,...
               Configuration.MATCHEDPAIR,...
               2, 3);

            o.layout.Ds = D1;

            o.layout.Output = 1;

            o.circuit = CircuitModel (o.layout);
        end
    end
end