classdef Ma_G_Tone < Circuit 
    
    methods
        function [o] = Ma_G_Tone
            
            o.layout.numNodes = 9;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (3, 0);
            
            R1 = Resistor (1.5e3, 1, 7);
            R2 = Resistor (100, 4, 5);
            R3 = Resistor (680, 7, 8);
            R4 = Resistor (680, 9, 0);
            o.layout.Rs = [R1; R2; R3; R4];

            C1 = Capacitor (4.7e-9, 1, 2);
            C2 = Capacitor (10e-9, 2, 4);
            C3 = Capacitor (220e-9, 6, 7);
            C4 = Capacitor (100e-9, 7, 9);
            C5 = Capacitor (68e-9, 8, 0);
            o.layout.Cs = [C1; C2; C3; C4; C5];

            % Bass Pot
            PtB = Potentiometer (10e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                8, 9, 0, 'Bass', 0.5);

            % Mid Pot
            PtM = Potentiometer (10e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5, 6, 0, 'Mid', 0.5);

            % Treble Pot
            PtT = Potentiometer (10e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 3, 8, 'Treble', 0.1);

            o.layout.Pots = [PtB; PtM; PtT];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end