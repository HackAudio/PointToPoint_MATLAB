classdef Fliege_Low_Pass < Circuit 
    
    methods
        function [o] = Fliege_Low_Pass
            
            o.layout.numNodes = 9;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);
            
            R1 = Resistor (500, 1, 8);
            R2 = Resistor (500, 3, 9);
            R3 = Resistor (500, 2, 7);
            R4 = Resistor (10e3, 5, 6);
            R5 = Resistor (10e3, 6, 0);
            o.layout.Rs = [R1; R2; R3; R4; R5];

            C1 = Capacitor (50e-9, 2, 3);
            C2 = Capacitor (50e-9, 4, 5);
            o.layout.Cs = [C1; C2];

            OP1 = OPAmp (2, 4, 5);
            OP2 = OPAmp (6, 4, 3);
            o.layout.OPAmps = [OP1; OP2];

            % Frequency Pot
            VrF1 = VariableResistor (10e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LOG,...
                8, 2, 'Cutoff', 1);

            VrF2 = VariableResistor (10e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LOG,...
                9, 4, 'Cutoff', 1);

            % Q Pot
            VrQ = VariableResistor (4e3, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                7, 3, 'Q', 0);

            o.layout.VarRs = [VrF1; VrF2; VrQ];
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end