classdef Fe_5F2A_Tonestack < Circuit 
    
    methods
        function [o] = Fe_5F2A_Tonestack
            
            o.layout.numNodes = 6;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);
            
            R1 = Resistor (38e3, 1, 2);
            R2 = Resistor (1e6, 5, 0);
            o.layout.Rs = [R1; R2];
            
            C1 = Capacitor (22e-9, 2, 3);
            C2 = Capacitor (4.7e-9, 4, 0);
            C3 = Capacitor (500e-12, 6, 5);
            o.layout.Cs = [C1; C2; C3];

            % Tone Pot
            PtTo = Potentiometer (1e6, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4, 3, 6, 'Tone', 0.5);

            % Volume Pot
            PtV = Potentiometer (1e6, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3, 5, 0, 'Volume', 1);
            
            o.layout.Pots = [PtTo; PtV];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end