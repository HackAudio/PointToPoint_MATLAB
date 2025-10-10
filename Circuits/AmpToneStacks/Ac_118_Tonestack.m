classdef Ac_118_Tonestack < Circuit

    methods
        function [o] = Ac_118_Tonestack

            o.layout.numNodes = 6;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (4, 0);

            R1 = Resistor (39e3, 1, 3);
            o.layout.Rs = R1;

            C1 = Capacitor (560e-12, 1, 2);
            C2 = Capacitor (0.12e-6, 3, 5);
            C3 = Capacitor (0.12e-6, 3, 6);
            o.layout.Cs = [C1; C2; C3];

            % Bass Pot
            VrB = VariableResistor (100e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5, 6, 'Bass', 1);

            % Mid Pot
            VrM = VariableResistor (4e3, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6, 0, 'Mid', 1);

            o.layout.VarRs = [VrB; VrM];

            % Treble Pot
            PtT = Potentiometer (100e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 4, 5, 'Treble', 1);
            
            o.layout.Pots = PtT;

            o.circuit = CircuitModel (o.layout);
        end
    end
end