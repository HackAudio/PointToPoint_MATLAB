classdef Fe_5E2_Tonestack < Circuit 
    
    methods
        function [o] = Fe_5E2_Tonestack
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (7, 0);
            
            R1 = Resistor (38e3, 1, 2);
            R2 = Resistor (100e3, 5, 4);
            R3 = Resistor (1e6, 7, 0);
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor (500e-12, 2, 3);
            C2 = Capacitor (5e-9, 6, 0);
            C3 = Capacitor (20e-9, 2, 5);
            o.layout.Cs = [C1; C2; C3];

            % Tone Pot
            PtTo = Potentiometer (250e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3, 4, 6, 'Tone', 0.65);

            % Volume Pot
            PtV = Potentiometer (1e6, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4, 7, 0, 'Volume', 1);
            
            o.layout.Pots = [PtTo; PtV];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end