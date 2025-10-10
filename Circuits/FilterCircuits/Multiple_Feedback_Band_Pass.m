classdef Multiple_Feedback_Band_Pass < Circuit 
    
    methods
        function [o] = Multiple_Feedback_Band_Pass
            
            o.layout.numNodes = 4;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (4, 0);

            R1 = Resistor (65e3, 2, 0);
            o.layout.Rs = R1;
            
            C1 = Capacitor (10e-9, 2, 3);
            C2 = Capacitor (10e-9, 2, 4);
            o.layout.Cs = [C1; C2];

            OP1 = OPAmp (0, 3, 4);
            o.layout.OPAmps = OP1;

            % Cutoff Pot
            VrF1 = VariableResistor (2e6, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LOG,...
                1, 2, 'Cutoff', 0.25);

            VrF2 = VariableResistor (4e6, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LOG,...
                4, 3, 'Cutoff', 0.25);

            o.layout.VarRs = [VrF1; VrF2];
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end