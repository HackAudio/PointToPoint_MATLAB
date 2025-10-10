classdef Ar_Tonestack < Circuit

    methods
        function [o] = Ar_Tonestack

            o.layout.numNodes = 8;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (8, 0);

            R1 = Resistor (1e3, 1, 2);
            R2 = Resistor (33e3, 2, 3);
            R3 = Resistor (220e3, 7, 8);
            R4 = Resistor (100e3, 4, 8);
            R5 = Resistor (1e6, 5, 8);
            R6 = Resistor (1e6, 8, 0);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6];

            C1 = Capacitor (1e-9, 2, 6);
            C2 = Capacitor (220e-9, 3, 0);
            C3 = Capacitor (1e-9, 7, 8);
            o.layout.Cs = [C1; C2; C3];

            % Bass Pot
            PtB = Potentiometer (100e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3, 4, 0, 'Bass', 1);

            % Mid Pot
            PtM = Potentiometer (100e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 5, 0, 'Mid', 1);

            % Treble Pot
            PtT = Potentiometer (100e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6, 7, 0, 'Treble', 1);
            
            o.layout.Pots = [PtB; PtM; PtT];

            o.circuit = CircuitModel (o.layout);
        end
    end
end