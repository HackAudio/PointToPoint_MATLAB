classdef Bl_HT5_Tonestack < Circuit

    methods
        function [o] = Bl_HT5_Tonestack

            o.layout.numNodes = 12;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (12, 0);

            R1 = Resistor (47e3, 2, 0);
            R2 = Resistor (4.7e3, 5, 6);
            R3 = Resistor (6.8e3, 4, 7);
            R4 = Resistor (22e3, 3, 8);
            R5 = Resistor (1e3, 9, 10);
            R6 = Resistor (470e3, 12, 0);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6];

            C1 = Capacitor (22e-6, 1, 2);
            C2 = Capacitor (220e-9, 6, 0);
            C3 = Capacitor (470e-9, 2, 4);
            C4 = Capacitor (4.7e-9, 2, 3);
            C5 = Capacitor (220e-9, 7, 9);
            C6 = Capacitor (100e-9, 11, 12);
            o.layout.Cs = [C1; C2; C3; C4; C5; C6];

            % Bass Pot
            VrB = VariableResistor (100e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                10, 0, 'Bass', 1);

            % Mid Pot
            VrM = VariableResistor (2.2e3, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                7, 6, 'Mid', 1);
            
            % ISF Pot
            VrI = VariableResistor (10e3, 4,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                8, 9, 'ISF', 0.5);

            o.layout.VarRs = [VrB; VrM; VrI];

            % Treble Pot
            PtT = Potentiometer (47e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3, 11, 9, 'Treble', 1);

            % ISF Pot
            PtI = Potentiometer (10e3, 4,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 4, 5, 'ISF', 0.5);
            
            o.layout.Pots = [PtT; PtI];

            o.circuit = CircuitModel (o.layout);
        end
    end
end