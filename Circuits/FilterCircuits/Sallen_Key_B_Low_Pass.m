classdef Sallen_Key_B_Low_Pass < Circuit 
    
    methods
        function [o] = Sallen_Key_B_Low_Pass
            
            o.layout.numNodes = 4;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (4, 0);

            C1 = Capacitor (10e-9, 3, 0);
            C2 = Capacitor (10e-9, 2, 4);
            o.layout.Cs = [C1; C2];

            OP1 = OPAmp (3, 4, 4);
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

            o.layout.VarRs = [VrF1; VrF2];
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end