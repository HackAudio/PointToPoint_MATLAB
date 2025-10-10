classdef Du_Ja_Tonestack < Circuit

    methods
        function [o] = Du_Ja_Tonestack

            o.layout.numNodes = 12;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (10, 0);

            R1 = Resistor (40e3, 1, 2);
            R2 = Resistor (150e3, 2, 4);
            R3 = Resistor (10e3, 8, 0);
            R4 = Resistor (4.7e6, 3, 0);
            R5 = Resistor (100e3, 7, 9);
            R6 = Resistor (1e6, 10, 0);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6];

            C1 = Capacitor (2e-9, 2, 3);
            C2 = Capacitor (100e-9, 4, 6);
            C3 = Capacitor (10e-9, 4, 5);
            C4 = Capacitor (4.7e-9, 11, 0);
            C5 = Capacitor (390e-12, 3, 12);
            C6 = Capacitor (220e-12, 9, 10);
            C7 = Capacitor (1e-9, 6, 8);
            o.layout.Cs = [C1; C2; C3; C4; C5; C6; C7];

            % Mid Pot
            VrM = VariableResistor (250e3, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5, 0, 'Mid', 1);

            o.layout.VarRs = VrM;

            % Bass Pot
            PtB = Potentiometer (312e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6, 7, 8, 'Bass', 1);

            % Treble Pot
            PtT = Potentiometer (270e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                12, 9, 11, 'Treble', 0.85);

            % Volume Pot
            PtV = Potentiometer (1e6, 4,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                9, 10, 0, 'Volume', 1);
            
            o.layout.Pots = [PtB; PtT; PtV];

            o.circuit = CircuitModel (o.layout);
        end
    end
end