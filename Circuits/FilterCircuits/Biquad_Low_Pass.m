classdef Biquad_Low_Pass < Circuit 
    
    methods
        function [o] = Biquad_Low_Pass
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);
            
            R1 = Resistor (5e3, 1, 2);
            R2 = Resistor (5e3, 2, 3);
            R3 = Resistor (5e3, 2, 7);
            R4 = Resistor (5e3, 5, 6);
            R5 = Resistor (5e3, 6, 7);
            o.layout.Rs = [R1; R2; R3; R4; R5];

            C1 = Capacitor (20e-9, 2, 3);
            C2 = Capacitor (20e-9, 4, 5);
            o.layout.Cs = [C1; C2];

            OP1 = OPAmp (0, 2, 3);
            OP2 = OPAmp (0, 4, 5);
            OP3 = OPAmp (0, 6, 7);
            o.layout.OPAmps = [OP1; OP2; OP3];

            % Frequency/Q Pot
            % Q increases alongside frequency in a biquad
            VrQ = VariableResistor (200e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LOG,...
                3, 4, 'Cutoff', 1);

            o.layout.VarRs = VrQ;
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end