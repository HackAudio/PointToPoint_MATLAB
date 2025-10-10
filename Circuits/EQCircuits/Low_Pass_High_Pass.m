classdef Low_Pass_High_Pass < Circuit 
    
    methods
        function [o] = Low_Pass_High_Pass
            
            o.layout.numNodes = 4;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (4, 0);

            R1 = Resistor (15e3, 2, 3);
            o.layout.Rs = R1;

            C1 = Capacitor (47e-9, 1, 2);
            C2 = Capacitor (1e-9, 4, 0);
            o.layout.Cs = [C1; C2];

            % HPF Pot
            VrHPF = VariableResistor (100e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LOG,...
                3, 0, 'HPF Cutoff', 0);

            % LPF Pot
            VrLPF = VariableResistor (100e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LOG,...
                2, 4, 'LPF Cutoff', 1);

            o.layout.VarRs = [VrHPF; VrLPF];
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end