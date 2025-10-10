classdef Am_B15_Tonestack < Circuit 
    
    methods
        function [o] = Am_B15_Tonestack
            
            o.layout.numNodes = 8;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (8, 0);
            
            R1 = Resistor (220e3, 1, 2);
            R2 = Resistor (120e3, 3, 7);
            R3 = Resistor (270e3, 3, 0);
            R4 = Resistor (22e3, 4, 0);
            R5 = Resistor (270e3, 7, 8);
            o.layout.Rs = [R1; R2; R3; R4; R5];
            
            C1 = Capacitor (0.001e-6, 2, 3);
            C2 = Capacitor (0.01e-6, 3, 4);
            C3 = Capacitor (47e-12, 1, 6);
            C4 = Capacitor (470e-12, 0, 5);
            o.layout.Cs = [C1; C2; C3; C4];

            % Bass Pot
            PtB = Potentiometer (1e6, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 3, 4, 'Bass', 1);

            % Treble Pot
            PtT = Potentiometer (1e6, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6, 7, 5, 'Treble', 1);

            o.layout.Pots = [PtB; PtT];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end
			