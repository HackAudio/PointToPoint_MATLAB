classdef Ac_165_Tonestack < Circuit

    methods
        function [o] = Ac_165_Tonestack

            o.layout.numNodes = 8;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (8, 0);

            R1 = Resistor (100e3, 1, 4);
            R2 = Resistor (100e3, 3, 7);
            o.layout.Rs = [R1; R2];

            C1 = Capacitor (250e-12, 1, 2);
            C2 = Capacitor (0.1e-6, 4, 5);
            C3 = Capacitor (0.047e-6, 4, 6);
            C4 = Capacitor (150e-12, 7, 8);
            C5 = Capacitor (27e-12, 8, 0);
            o.layout.Cs = [C1; C2; C3; C4; C5];

            % Bass Pot
            VrB = VariableResistor (250e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5, 6, 'Bass', 1);

            % Mid Pot
            VrM = VariableResistor (10e3, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6, 0, 'Mid', 1);

            o.layout.VarRs = [VrB; VrM];

            % Treble Pot
            PtT = Potentiometer (250e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 3, 5, 'Treble', 0.55);

            % Volume Pot
            PtV = Potentiometer (1e6, 4,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                7, 8, 0, 'Volume', 1);
            
            o.layout.Pots = [PtT; PtV];

            o.circuit = CircuitModel (o.layout);
        end
    end
end