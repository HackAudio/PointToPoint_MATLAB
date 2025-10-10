classdef HiLo_1073 < Circuit 
    
    methods
        function [o] = HiLo_1073
            
            o.layout.numNodes = 12;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (6, 0);
            
            R1 = Resistor (6.2e3, 1, 2);
            R2 = Resistor (6.2e3, 5, 6);
            R3 = Resistor (12e3, 4, 7);
            R4 = Resistor (620, 1, 8);
            R5 = Resistor (620, 12, 6);
            R6 = Resistor (12e3, 3, 0);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6];

            C1 = Capacitor (15e-9, 2, 3);
            C2 = Capacitor (15e-9, 3, 5);
            C3 = Capacitor (15e-9, 7, 10);
            C4 = Capacitor (22e-9, 8, 9);
            C5 = Capacitor (22e-9, 11, 12);
            C6 = Capacitor (10e-9, 4, 3);
            C7 = Capacitor (470e-12, 7, 6);
            o.layout.Cs = [C1; C2; C3; C4; C5; C6; C7];

            OP1 = OPAmp (0, 7, 6);
            o.layout.OPAmps = OP1;

            % Bass Pot
            PtB = Potentiometer (50e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 4, 5, 'Bass', 0.5);

            % Treble Pot
            PtT = Potentiometer (10e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                9, 10, 11, 'Treble', 0.5);

            o.layout.Pots = [PtB; PtT];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end