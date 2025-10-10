classdef Baxandall_B_2_Bands < Circuit 
    
    methods
        function [o] = Baxandall_B_2_Bands
            
            o.layout.numNodes = 9;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);
            
            R1 = Resistor (1.8e3, 1, 2);
            R2 = Resistor (1.8e3, 4, 5);
            R3 = Resistor (12e3, 3, 8);
            R4 = Resistor (1.2e3, 6, 5);
            R5 = Resistor (1.2e3, 1, 9);
            o.layout.Rs = [R1; R2; R3; R4; R5];

            C1 = Capacitor (100e-9, 4, 3);
            C2 = Capacitor (100e-9, 2, 3);
            C3 = Capacitor (12e-9, 8, 7);
            o.layout.Cs = [C1; C2; C3];

            OP1 = OPAmp (0, 8, 5);
            o.layout.OPAmps = OP1;

            % Bass Pot
            PtB = Potentiometer (10e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 3, 4, 'Bass', 0.5);

            % Treble Pot
            PtT = Potentiometer (10e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                9, 7, 6, 'Treble', 0.5);

            o.layout.Pots = [PtB; PtT];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end