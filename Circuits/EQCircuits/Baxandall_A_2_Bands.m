classdef Baxandall_A_2_Bands < Circuit 
    
    methods
        function [o] = Baxandall_A_2_Bands
            
            o.layout.numNodes = 8;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (8, 0);
            
            R1 = Resistor (1.8e3, 1, 2);
            R2 = Resistor (1.8e3, 4, 8);
            R3 = Resistor (22e3, 3, 5);
            R4 = Resistor (9.1e3, 5, 6);
            o.layout.Rs = [R1; R2; R3; R4];

            C1 = Capacitor (100e-9, 2, 4);
            C2 = Capacitor (4.7e-9, 6, 7);
            C3 = Capacitor (22e-12, 5, 8);
            o.layout.Cs = [C1; C2; C3];

            OP1 = OPAmp (0, 5, 8);
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
                1, 7, 8, 'Treble', 0.5);

            o.layout.Pots = [PtB; PtT];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end