classdef Ma_G_Drive < Circuit 
    
    methods
        function [o] = Ma_G_Drive
            
            o.layout.numNodes = 8;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (7, 0);
            
            R1 = Resistor (10e3, 2, 3);
            R2 = Resistor (680e3, 4, 5);
            R3 = Resistor (1e3, 6, 7);
            R4 = Resistor (4.7e3, 8, 0);
            o.layout.Rs = [R1; R2; R3; R4];

            C1 = Capacitor (220e-9, 1, 2);
            C2 = Capacitor (100e-9, 3, 4);
            C3 = Capacitor (220e-12, 4, 5);
            C4 = Capacitor (220e-9, 5, 6);
            o.layout.Cs = [C1; C2; C3; C4];

            D1 = Diode (Semiconductor.SILICON,...
               Configuration.MATCHEDPAIR,...
               7, 0);
            D2 = Diode (Semiconductor.SILICON,...
               Configuration.SINGLE,...
               8, 3);
            o.layout.Ds = [D1; D2];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end