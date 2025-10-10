classdef State_Variable_B_Band_60Hz < Circuit 
    
    methods
        function [o] = State_Variable_B_Band_60Hz
            
            o.layout.numNodes = 9;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (7, 0);
            
            R1 = Resistor (10e3, 1, 2);
            R2 = Resistor (10e3, 2, 3);
            R3 = Resistor (10e3, 2, 7);
            R4 = Resistor (5e3, 3, 4); % Q
            R5 = Resistor (10e3, 4, 5);
            R6 = Resistor (10e3, 4, 9);
            R7 = Resistor (530e3, 5, 6);
            R8 = Resistor (530e3, 7, 8);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6; R7; R8];

            C1 = Capacitor (5e-9, 6, 7);
            C2 = Capacitor (5e-9, 8, 9);
            o.layout.Cs = [C1; C2];

            OP1 = OPAmp (0, 2, 3);
            OP2 = OPAmp (0, 4, 5);
            OP3 = OPAmp (0, 6, 7);
            OP4 = OPAmp (0, 8, 9);
            o.layout.OPAmps = [OP1; OP2; OP3; OP4];
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end