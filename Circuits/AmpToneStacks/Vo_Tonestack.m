classdef Vo_Tonestack < Circuit 
    
    methods
        function [o] = Vo_Tonestack 
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (4, 0);
            
            R1 = Resistor (717, 1, 2);
            R2 = Resistor (100e3, 2, 5);
            R3 = Resistor (10e3, 7, 0);
            R4 = Resistor (600e3, 4, 0);
            o.layout.Rs = [R1; R2; R3; R4];
            
            C1 = Capacitor (47e-12, 2, 3);
            C2 = Capacitor (22e-9, 5, 6);
            C3 = Capacitor (22e-9, 5, 7);
            o.layout.Cs = [C1; C2; C3];

            % Bass Pot
            PtB = Potentiometer (1e6, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6, 7, 0, 'Bass', 0.5);

            % Treble Pot
            PtT = Potentiometer (1e6, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3, 4, 6, 'Treble', 0.5);

            o.layout.Pots = [PtB; PtT];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end