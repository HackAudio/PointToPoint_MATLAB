classdef Mt_HB_Tone < Circuit 
    
    methods
        function [o] = Mt_HB_Tone
            
            o.layout.numNodes = 8;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (8, 0);
            
            R1 = Resistor (1.5e3, 1, 0);
            R2 = Resistor (100e3, 1, 2);
            R3 = Resistor (10e3, 0, 4);
            R4 = Resistor (100e3, 6, 7);
            o.layout.Rs = [R1; R2; R3; R4];

            C1 = Capacitor (50e-12, 1, 5);
            C2 = Capacitor (0.022e-6, 2, 3);
            C3 = Capacitor (0.022e-6, 2, 4);
            o.layout.Cs = [C1; C2; C3];

            % Bass Pot
            PtB = Potentiometer (1e6, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3, 4, 0, 'Bass', 1);

            % Treble Pot
            PtT = Potentiometer (1e6, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5, 6, 3, 'Treble', 1);

            % Output Pot
            PtO = Potentiometer (1e6, 3,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                0, 7, 8, 'Output', 1);

            o.layout.Pots = [PtB; PtT; PtO];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end