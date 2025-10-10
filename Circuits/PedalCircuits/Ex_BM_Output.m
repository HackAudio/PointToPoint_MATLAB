classdef Ex_BM_Output < Circuit 
    
    methods
        function [o] = Ex_BM_Output
            
            o.layout.numNodes = 6;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (6, 0);
            o.layout.Vs = VoltageSource (9, 5);
            
            R1 = Resistor (430e3, 5, 2);
            R2 = Resistor (100e3, 2, 0);
            R3 = Resistor (15e3, 5, 3);
            R4 = Resistor (8e3, 4, 0);
            o.layout.Rs = [R1; R2; R3; R4];

            C1 = Capacitor (100e-9, 1, 2);
            C2 = Capacitor (100e-9, 3, 6);
            o.layout.Cs = [C1; C2];

            BJT1 = BJT (Doping.NPN,...
                Semiconductor.SILICON,...
                2, 3, 4);
            o.layout.BJTs = BJT1;
            
            o.layout.hasDCBlocker = true;

            o.layout.Output = 0.94;
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end 