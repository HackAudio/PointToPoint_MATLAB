classdef Dr_Tonestack < Circuit

    methods
        function [o] = Dr_Tonestack

            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (4, 0);

            R1 = Resistor (38e3, 1, 2);
            R2 = Resistor (330e3, 3, 5);
            R3 = Resistor (330e3, 4, 5);
            R4 = Resistor (1e6, 4, 0);
            o.layout.Rs = [R1; R2; R3; R4];

            C1 = Capacitor (10e-9, 2, 3);
            C2 = Capacitor (120e-12, 3, 4);
            C3 = Capacitor (4700e-12, 5, 0);
            o.layout.Cs = [C1; C2; C3];

            % Tone Pot
            PtTo = Potentiometer (1e6, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4, 5, 0, 'Tone', 0.5);
            
            o.layout.Pots = PtTo;

            o.circuit = CircuitModel (o.layout);
        end
    end
end