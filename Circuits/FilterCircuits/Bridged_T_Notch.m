classdef Bridged_T_Notch < Circuit 
    
    methods
        function [o] = Bridged_T_Notch
            
            o.layout.numNodes = 4;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (4, 0);

            C1 = Capacitor (10e-9, 1, 2);
            C2 = Capacitor (100e-9, 3, 0);
            o.layout.Cs = [C1; C2];

            OP1 = OPAmp (2, 4, 4);
            o.layout.OPAmps = OP1;

            % Frequency Pot
            VrF1 = VariableResistor (200e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LOG,...
                1, 3, 'Frequency', 1);

            VrF2 = VariableResistor (200e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LOG,...
                3, 2, 'Frequency', 1);

            o.layout.VarRs = [VrF1; VrF2];
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end