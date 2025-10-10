classdef Gi_16T_Tonestack < Circuit 
    
    methods
        function [o] = Gi_16T_Tonestack
            
            o.layout.numNodes = 4;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (4, 0);
            
            C1 = Capacitor (0.005e-6, 2, 0);
            C2 = Capacitor (500e-12, 3, 4);
            o.layout.Cs = [C1; C2];

            % Tone Pot
            PtTo = Potentiometer (1e6, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LOG,...
                2, 1, 3, 'Tone', 1);

            % Volume Pot
            PtV = Potentiometer (1e6, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LOG,...
                1, 4, 0, 'Volume', 1);
            
            o.layout.Pots = [PtTo; PtV];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end