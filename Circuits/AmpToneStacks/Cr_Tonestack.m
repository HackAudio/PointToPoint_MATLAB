classdef Cr_Tonestack < Circuit 
    
    methods
        function [o] = Cr_Tonestack 
            
            o.layout.numNodes = 9;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (7, 0);
            
            R1 = Resistor (1e3, 1, 2);
            R2 = Resistor (68e3, 2, 5);
            R3 = Resistor (47e3, 9, 0);
            R4 = Resistor (22e3, 3, 4);
            R5 = Resistor (10e3, 8, 0);
            R6 = Resistor (1e6, 7, 0);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6];
            
            C1 = Capacitor (220e-12, 2, 3);
            C2 = Capacitor (47e-9, 5, 6);
            C3 = Capacitor (220e-9, 5, 9);
            C4 = Capacitor (4.7e-9, 9, 0);
            o.layout.Cs = [C1; C2; C3; C4];
            
            % Bass Pot
            VrB = VariableResistor (250e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6, 8, 'Bass', 1);

            % Mid Pot
            VrM = VariableResistor (50e3, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                9, 0, 'Mid', 1);

            o.layout.VarRs = [VrB; VrM];

            % Treble Pot
            PtT = Potentiometer (250e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4, 7, 6, 'Treble', 0.35);
            
            o.layout.Pots = PtT;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end