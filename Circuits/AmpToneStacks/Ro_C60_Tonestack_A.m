classdef Ro_C60_Tonestack_A < Circuit

    methods
        function [o] = Ro_C60_Tonestack_A

            o.layout.numNodes = 10;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (10, 0);

            R1 = Resistor (49e3, 1, 4);
            R2 = Resistor (10e3, 6, 0);
            R3 = Resistor (1e3, 9, 10);
            o.layout.Rs = [R1; R2; R3];

            C1 = Capacitor (240e-12, 1, 2);
            C2 = Capacitor (0.033e-6, 4, 5);
            C3 = Capacitor (0.082e-6, 4, 7);
            C4 = Capacitor (0.01e-6, 7, 0);
            C5 = Capacitor (0.015e-6, 8, 9);
            o.layout.Cs = [C1; C2; C3; C4; C5];

            D1 = Diode (Semiconductor.SILICON,...
               Configuration.MATCHEDPAIR,...
               8, 0);

            o.layout.Ds = D1;

            % Bass Pot
            VrB = VariableResistor (250e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5, 6, 'Bass', 0.25);

            % Mid Pot
            VrM = VariableResistor (10e3, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                7, 0, 'Mid', 1);

            o.layout.VarRs = [VrB; VrM];

            % Treble Pot
            PtT = Potentiometer (250e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 3, 5, 'Treble', 1);

            % Volume Pot
            PtV = Potentiometer (1e6, 4,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3, 8, 0, 'Volume', 1);
            
            o.layout.Pots = [PtT; PtV];

            o.circuit = CircuitModel (o.layout);
        end
    end
end