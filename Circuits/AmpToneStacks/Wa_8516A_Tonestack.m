classdef Wa_8516A_Tonestack < Circuit

    methods
        function [o] = Wa_8516A_Tonestack

            o.layout.numNodes = 6;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (6, 0);

            R1 = Resistor (100e3, 1, 0);
            R2 = Resistor (220e3, 3, 0);
            R3 = Resistor (60e3, 3, 5);
            o.layout.Rs = [R1; R2; R3];

            C1 = Capacitor (0.02e-6, 1, 2);
            C2 = Capacitor (0.00068e-6, 2, 3);
            C3 = Capacitor (0.003e-6, 3, 4);
            C4 = Capacitor (0.003e-6, 4, 5);
            o.layout.Cs = [C1; C2; C3; C4];

            % Bass Pot
            VrB = VariableResistor (1e6, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 3, 'Bass', 1);

            % Treble Pot
            VrT = VariableResistor (1e6, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LOG,...
                4, 0, 'Treble', 1);

            o.layout.VarRs = [VrB; VrT];

            % Volume Pot
            PtV = Potentiometer (1e6, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5, 6, 0, 'Volume', 1);
            
            o.layout.Pots = PtV;

            o.circuit = CircuitModel (o.layout);
        end
    end
end