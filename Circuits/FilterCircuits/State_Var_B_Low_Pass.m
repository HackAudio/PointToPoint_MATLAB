classdef State_Var_B_Low_Pass < Circuit 
    
    methods
        function [o] = State_Var_B_Low_Pass
            
            o.layout.numNodes = 12;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (12, 0);
            
            R1 = Resistor (10e3, 1, 2);
            R2 = Resistor (10e3, 2, 3);
            R3 = Resistor (10e3, 2, 9);
            R4 = Resistor (7.07e3, 4, 5);
            R5 = Resistor (10e3, 5, 6);
            R6 = Resistor (10e3, 5, 12);
            R7 = Resistor (5e3, 7, 8);
            R8 = Resistor (5e3, 10, 11);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6; R7; R8];

            C1 = Capacitor (5e-9, 8, 9);
            C2 = Capacitor (5e-9, 11, 12);
            o.layout.Cs = [C1; C2];

            OP1 = OPAmp (0, 2, 3);
            OP2 = OPAmp (0, 5, 6);
            OP3 = OPAmp (0, 8, 9);
            OP4 = OPAmp (0, 11, 12);
            o.layout.OPAmps = [OP1; OP2; OP3; OP4];

            % Cutoff Pot
            VrF1 = VariableResistor (500e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LOG,...
                6, 7, 'Cutoff', 1);

            VrF2 = VariableResistor (500e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LOG,...
                9, 10, 'Cutoff', 1);

            % Q Pot
            VrQ = VariableResistor (14.1e3, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3, 4, 'Q', 0);

            o.layout.VarRs = [VrF1; VrF2; VrQ];
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end