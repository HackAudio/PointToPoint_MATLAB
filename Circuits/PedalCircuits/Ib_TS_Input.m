classdef Ib_TS_Input < Circuit 
    
    methods
        function [o] = Ib_TS_Input
            
            o.layout.numNodes = 6;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (6, 0);
            Vs1 = VoltageSource (4.5, 4);
            Vs2 = VoltageSource (9, 5);
            o.layout.Vs = [Vs1; Vs2];
            
            R1 = Resistor (1e3, 2, 3);
            R2 = Resistor (510e3, 4, 3);
            R3 = Resistor (10e3, 6, 0);
            o.layout.Rs = [R1; R2; R3];

            C1 = Capacitor (0.02e-6, 1, 2);
            o.layout.Cs = C1;

            BJT1 = BJT(Doping.NPN,...
                 Semiconductor.SILICON,...
                 3, 5, 6);
            o.layout.BJTs = BJT1;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end