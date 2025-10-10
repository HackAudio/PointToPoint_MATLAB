classdef State_Variable_A_High_250Hz < Circuit 
    
    methods
        function [o] = State_Variable_A_High_250Hz
            
            o.layout.numNodes = 6;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (4, 0);
            
            R1 = Resistor (10e3, 1, 2);
            R2 = Resistor (10e3, 3, 0);
            R3 = Resistor (10e3, 3, 4);
            R4 = Resistor (10e3, 2, 6);
            R5 = Resistor (6.37e3, 4, 5);
            o.layout.Rs = [R1; R2; R3; R4; R5];

            C1 = Capacitor (100e-9, 5, 6);
            o.layout.Cs = C1;

            OP1 = OPAmp (2, 3, 4);
            OP2 = OPAmp (0, 5, 6);
            o.layout.OPAmps = [OP1; OP2];

            o.circuit = CircuitModel (o.layout);
        end
    end
end