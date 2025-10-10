classdef Bo_BD2_Clipping < Circuit 
    
    methods
        function [o] = Bo_BD2_Clipping
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);
            
            R1 = Resistor (100e3, 1, 2);
            R2 = Resistor (330e3, 3, 5);
            R3 = Resistor (15e3, 4, 0);
            R4 = Resistor (1e6, 4, 5);
            o.layout.Rs = [R1; R2; R3; R4];

            C1 = Capacitor (220e-12, 1, 3);
            C2 = Capacitor (100e-9, 2, 5);
            C3 = Capacitor (47e-9, 2, 4);
            o.layout.Cs = [C1; C2; C3];

            D1 = Diode (Semiconductor.SILICON,...
               Configuration.SINGLE,...
               5, 6);
            D2 = Diode (Semiconductor.SILICON,...
               Configuration.SINGLE,...
               6, 0);
            D3 = Diode (Semiconductor.SILICON,...
               Configuration.SINGLE,...
               0, 7);
            D4 = Diode (Semiconductor.SILICON,...
               Configuration.SINGLE,...
               7, 5);
            o.layout.Ds = [D1; D2; D3; D4];

            o.circuit = CircuitModel (o.layout);

        end
    end
end