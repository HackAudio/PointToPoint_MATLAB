classdef Baxandall_E_3_Bands < Circuit 
    
    methods
        function [o] = Baxandall_E_3_Bands
            
            o.layout.numNodes = 12;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);
            
            R1 = Resistor (6.8e3, 1, 2);
            R2 = Resistor (6.8e3, 4, 5);
            R3 = Resistor (2.2e3, 7, 5);
            R4 = Resistor (2.2e3, 1, 9);
            R5 = Resistor (68e3, 3, 6);
            R6 = Resistor (15e3, 8, 10);
            R7 = Resistor (10e3, 10, 11);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6; R7];

            C1 = Capacitor (47e-9, 2, 4);
            C2 = Capacitor (10e-9, 9, 7);
            C3 = Capacitor (2.2e-9, 11, 12);
            C4 = Capacitor (10e-9, 10, 6);
            o.layout.Cs = [C1; C2; C3; C4];

            OP1 = OPAmp (0, 6, 5);
            o.layout.OPAmps = OP1;

            % Bass Pot
            PtB = Potentiometer (20e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 3, 4, 'Bass', 0.5);

            % Mid Pot
            PtM = Potentiometer (20e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                9, 8, 7, 'Mid', 0.5);

            % Treble Pot
            PtT = Potentiometer (20e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1, 12, 5, 'Treble', 0.5);

            o.layout.Pots = [PtB; PtM; PtT];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end