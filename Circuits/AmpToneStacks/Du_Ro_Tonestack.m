classdef Du_Ro_Tonestack < Circuit

    methods
        function [o] = Du_Ro_Tonestack

            o.layout.numNodes = 10;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (10, 0);

            R1 = Resistor (40e3, 1, 2);
            R2 = Resistor (150e3, 2, 4);
            R3 = Resistor (10e3, 7, 0);
            R4 = Resistor (4.7e6, 3, 0);
            R5 = Resistor (1e6, 10, 0);
            o.layout.Rs = [R1; R2; R3; R4; R5];

            C1 = Capacitor (2e-9, 2, 3);
            C2 = Capacitor (100e-9, 4, 6);
            C3 = Capacitor (10e-9, 4, 5);
            C4 = Capacitor (1e-9, 6, 7);
            C5 = Capacitor (390e-12, 3, 9);
            C6 = Capacitor (220e-12, 8, 10);
            o.layout.Cs = [C1; C2; C3; C4; C5; C6];

            % Bass Pot
            VrB = VariableResistor (312e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6, 7, 'Bass', 0.8);

            % Mid Pot
            VrM = VariableResistor (250e3, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5, 0, 'Mid', 1);

            o.layout.VarRs = [VrB; VrM];

            % Treble Pot
            PtT = Potentiometer (270e3, 3,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6, 8, 9, 'Treble', 0.5);

            % Volume Pot
            PtV = Potentiometer (1e6, 4,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                8, 10, 0, 'Volume', 1);
            
            o.layout.Pots = [PtT; PtV];

            o.circuit = CircuitModel (o.layout);
        end
    end
end