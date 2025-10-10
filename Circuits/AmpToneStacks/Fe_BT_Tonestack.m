classdef Fe_BT_Tonestack < Circuit 
    
    methods
        function [o] = Fe_BT_Tonestack
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (6, 0);
            
            R1 = Resistor (180e3, 1, 3);
            R2 = Resistor (10e3, 5, 0);
            R3 = Resistor (70e3, 4, 6);
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor (0.25e-9, 1, 2);
            C2 = Capacitor (1e-9, 3, 4);
            C3 = Capacitor (10e-9, 4, 5);
            C4 = Capacitor (50e-9, 7, 0);
            o.layout.Cs = [C1; C2; C3; C4];

            % Bass Pot
            PtB = Potentiometer (1e6, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3, 4, 5, 'Bass', 1);

            % Treble Pot
            PtV = Potentiometer (350e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 6, 7, 'Treble', 0.8);
            
            o.layout.Pots = [PtB; PtV];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end