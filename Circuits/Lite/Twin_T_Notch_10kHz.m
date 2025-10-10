classdef Twin_T_Notch_10kHz < Circuit 
    
    methods
        function [o] = Twin_T_Notch_10kHz
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (6, 0);
            
            R1 = Resistor (1.35e3, 1, 2);
            R2 = Resistor (1.35e3, 2, 4);
            R3 = Resistor (675, 3, 5);
            R4 = Resistor (1e3, 6, 7);
            R5 = Resistor (10e3, 7, 0);
            o.layout.Rs = [R1; R2; R3; R4; R5];

            C1 = Capacitor (10e-9, 1, 3);
            C2 = Capacitor (10e-9, 3, 4);
            C3 = Capacitor (20e-9, 2, 5);
            o.layout.Cs = [C1; C2; C3];

            OP1 = OPAmp (4, 6, 6);
            OP2 = OPAmp (7, 5, 5);
            o.layout.OPAmps = [OP1; OP2];
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end