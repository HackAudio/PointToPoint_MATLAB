classdef Ro_JC_Tonestack < Circuit

    methods
        function [o] = Ro_JC_Tonestack

            o.layout.numNodes = 11;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (11, 0);

            R1 = Resistor (100e3, 1, 3);
            R2 = Resistor (1e3, 5, 6);
            R3 = Resistor (100e3, 7, 9);
            R4 = Resistor (1e6, 11, 0);
            o.layout.Rs = [R1; R2; R3; R4];

            C1 = Capacitor (150e-12, 1, 2);
            C2 = Capacitor (0.082e-6, 3, 4);
            C3 = Capacitor (0.047e-6, 3, 6);
            C4 = Capacitor (470e-12, 7, 8);
            C5 = Capacitor (0.082e-6, 10, 11);
            o.layout.Cs = [C1; C2; C3; C4; C5];

            % Bass Pot
            VrB = VariableResistor (250e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4, 5, 'Bass', 1);

            % Mid Pot
            VrM = VariableResistor (10e3, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6, 0, 'Mid', 1);

            % High Pot
            VrH = VariableResistor (1e6, 4,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                8, 10, 'High', 0);

            o.layout.VarRs = [VrB; VrM; VrH];

            % Treble Pot
            PtT = Potentiometer (250e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 7, 4, 'Treble', 0.45);

            % Volume Pot
            PtV = Potentiometer (1e6, 5,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                9, 10, 0, 'Volume', 1);
            
            o.layout.Pots = [PtT; PtV];

            o.circuit = CircuitModel (o.layout);
        end
    end
end