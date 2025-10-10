classdef Sallen_Key_C_Low_Pass < Circuit 
    
    methods
        function [o] = Sallen_Key_C_Low_Pass
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);

            R1 = Resistor (500e3, 5, 0);
            o.layout.Rs = R1;

            C1 = Capacitor (10e-9, 3, 0);
            C2 = Capacitor (10e-9, 2, 4);
            o.layout.Cs = [C1; C2];

            OP1 = OPAmp (3, 5, 4);
            o.layout.OPAmps = OP1;

            % Cutoff Pot
            VrF1 = VariableResistor (500e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LOG,...
                1, 2, 'Cutoff', 1);

            VrF2 = VariableResistor (500e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LOG,...
                2, 3, 'Cutoff', 1);

            % Q Pot
            VrQ = VariableResistor (857e3, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4, 5, 'Q', 0.35);

            o.layout.VarRs = [VrF1; VrF2; VrQ];
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end