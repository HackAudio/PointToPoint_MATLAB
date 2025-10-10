classdef Baxandall_C_2_Bands < Circuit 
    
    methods
        function [o] = Baxandall_C_2_Bands
            
            o.layout.numNodes = 11;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);
            
            R1 = Resistor (1.8e3, 1, 2);
            R2 = Resistor (1.8e3, 4, 5);
            R3 = Resistor (12e3, 3, 8);
            R4 = Resistor (1e3, 8, 7);
            R5 = Resistor (1e3, 5, 6);
            R6 = Resistor (1e3, 1, 10);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6];

            C1 = Capacitor (100e-9, 2, 4);
            C2 = Capacitor (15e-9, 6, 11);
            C3 = Capacitor (15e-9, 9, 10);
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
                9, 7, 11, 'Treble', 0.5);

            o.layout.Pots = [PtB; PtT];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end