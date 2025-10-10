classdef Ep_EA32_Tonestack < Circuit

    methods
        function [o] = Ep_EA32_Tonestack

            o.layout.numNodes = 6;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);

            R1 = Resistor (470e3, 1, 0);
            R2 = Resistor (220e3, 2, 3);
            R3 = Resistor (220e3, 3, 4);
            o.layout.Rs = [R1; R2; R3];

            C1 = Capacitor (0.001e-6, 1, 2);
            C2 = Capacitor (500e-12, 2, 4);
            C3 = Capacitor (0.003e-6, 3, 0);
            C4 = Capacitor (0.0047e-6, 6, 0);
            o.layout.Cs = [C1; C2; C3; C4];

            % Bass Pot
            VrB = VariableResistor (2e6, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1, 2, 'Bass', 1);

            % Treble Pot
            VrT = VariableResistor (2e6, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LOG,...
                4, 6, 'Treble', 0.75);

            o.layout.VarRs = [VrB; VrT];

            % Volume Pot
            PtV = Potentiometer (500e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4, 5, 0, 'Volume', 1);
            
            o.layout.Pots = PtV;

            o.circuit = CircuitModel (o.layout);
        end
    end
end