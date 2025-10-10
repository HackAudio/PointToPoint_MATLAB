classdef Ro_JC_Stage_1 < Circuit 
    
    methods
        function [o] = Ro_JC_Stage_1
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);
            
            R1 = Resistor (1e3, 1, 2);
            R2 = Resistor (1e6, 2, 0);
            R3 = Resistor (39e3, 3, 0);
            R4 = Resistor (100e3, 3, 4);
            R5 = Resistor (1e6, 5, 0);
            o.layout.Rs = [R1; R2; R3; R4; R5];
            
            C1 = Capacitor (100e-12, 2, 0);
            C2 = Capacitor (47e-12, 3, 4);
            C3 = Capacitor (0.082e-6, 4, 5);
            o.layout.Cs = [C1; C2; C3];

            OP1 = OPAmp (2, 3, 4);
            o.layout.OPAmps = OP1;

            o.layout.Output = 0.88;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end