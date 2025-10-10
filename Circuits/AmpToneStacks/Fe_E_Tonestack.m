classdef Fe_E_Tonestack < Circuit 
    
    methods
        function [o] = Fe_E_Tonestack
            
            o.layout.numNodes = 8;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (6, 0);
            
            R1 = Resistor (1300, 1, 2);
            R2 = Resistor (220e3, 3, 0);
            R3 = Resistor (100e3, 3, 4);
            R4 = Resistor (220e3, 4, 6);
            o.layout.Rs = [R1; R2; R3; R4];
            
            C1 = Capacitor (10e-9, 8, 0);
            C2 = Capacitor (250e-12, 2, 7);
            C3 = Capacitor (100e-9, 2, 3);
            C4 = Capacitor (5e-9, 5, 0);
            o.layout.Cs = [C1; C2; C3; C4];

            % Bass Pot
            PtB = Potentiometer (1e6, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                0, 4, 5, 'Bass', 1);

            % Treble Pot
            PtT = Potentiometer (1e6, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                7, 6, 8, 'Treble', 1);
            
            o.layout.Pots = [PtB; PtT];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end