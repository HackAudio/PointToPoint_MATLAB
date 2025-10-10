classdef El_D_Output < Circuit 
    
    methods
        function [o] = El_D_Output
            
            o.layout.numNodes = 6;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);
            o.layout.Vs = VoltageSource (9, 6);
            
            R1 = Resistor (3.3e6, 2, 3);
            R2 = Resistor (47e3, 6, 3);
            R3 = Resistor (4.7e3, 4, 0);
            o.layout.Rs = [R1; R2; R3];

            C1 = Capacitor (100e-9, 1, 2);
            C2 = Capacitor (100e-9, 3, 5);
            o.layout.Cs = [C1; C2];

            BJT1 = BJT(Doping.NPN,...
                 Semiconductor.SILICON,...
                 2, 3, 4);
            o.layout.BJTs = BJT1;

            D1 = Diode (Semiconductor.GERMANIUM,...
               Configuration.MATCHEDPAIR,...
               5, 0);
            o.layout.Ds = D1;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end