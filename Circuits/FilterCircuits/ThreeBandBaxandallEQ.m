classdef ThreeBandBaxandallEQ < Circuit 
    
    methods
        function [o] = ThreeBandBaxandallEQ
            
            o.layout.numNodes = 12;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (12, 0);
            
            R1 = Resistor (6.8e3, 1, 2);
            R2 = Resistor (6.8e3, 4, 12);
            R3 = Resistor (2.2e3, 7, 12);
            R4 = Resistor (2.2e3, 1, 5);
            R5 = Resistor (68e3, 3, 9);
            R6 = Resistor (15e3, 6, 8);
            R7 = Resistor (10e3, 8, 10);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6; R7];

            C1 = Capacitor (47e-9, 2, 4);
            C2 = Capacitor (10e-9, 5, 7);
            C3 = Capacitor (2.2e-9, 10, 11);
            C4 = Capacitor (10e-9, 8, 9);
            o.layout.Cs = [C1; C2; C3; C4];

            OP1 = OPAmp (0, 9, 12);
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
                5, 6, 7, 'Mid', 0.5);

            % Treble Pot
            PtT = Potentiometer (20e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1, 11, 12, 'Treble', 0.5);

            o.layout.Pots = [PtB; PtM; PtT];
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end