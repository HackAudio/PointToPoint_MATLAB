classdef Mo_Tonestack < Circuit 
    
    methods
        function [o] = Mo_Tonestack 
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (3, 0);
            
            R1 = Resistor (220e3, 1, 4);
            R2 = Resistor (470e3, 1, 2);
            R3 = Resistor (270e3, 2, 0);
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor (560e-12, 5, 2);
            o.layout.Cs = C1;
            
            % Tone Pot
            PtTo = Potentiometer (500e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4, 5, 0, 'Tone', 0.5);

            % Volume Pot
            PtV = Potentiometer (1e6, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 3, 0, 'Volume', 1);

            o.layout.Pots = [PtTo; PtV];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end