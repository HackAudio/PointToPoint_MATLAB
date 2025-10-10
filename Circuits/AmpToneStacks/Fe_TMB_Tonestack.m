classdef Fe_TMB_Tonestack < Circuit

    methods
        function [o] = Fe_TMB_Tonestack

            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (7, 0);

            R1 = Resistor (39e3, 1, 2);
            R2 = Resistor (100e3, 2, 4);
            R3 = Resistor (1e6, 7, 0);
            o.layout.Rs = [R1; R2; R3];

            C1 = Capacitor (250e-12, 2, 3);
            C2 = Capacitor (100e-9, 4, 5);
            C3 = Capacitor (47e-9, 4, 6);
            o.layout.Cs = [C1; C2; C3];

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
                3, 7, 5, 'Treble', 0.75);
            
            o.layout.Pots = PtT;

            o.circuit = CircuitModel (o.layout);
        end
    end
end