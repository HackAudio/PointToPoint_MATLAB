classdef TwoLFBaxandallToneControl < Circuit 
    
    methods
        function [o] = TwoLFBaxandallToneControl
            
            o.layout.numNodes = 9;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (9, 0);
            
            R1 = Resistor (1.8e3, 1, 2);
            R2 = Resistor (1.8e3, 4, 9);
            R3 = Resistor (12e3, 3, 5);
            R4 = Resistor (1.2e3, 6, 9);
            R5 = Resistor (1.2e3, 1, 8);
            o.layout.Rs = [R1; R2; R3; R4; R5];

            C1 = Capacitor (100e-9, 4, 3);
            C2 = Capacitor (100e-9, 3, 2);
            C3 = Capacitor (12e-9, 5, 7);
            o.layout.Cs = [C1; C2; C3];

            OP1 = OPAmp (0, 5, 9);
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
                8, 7, 6, 'Treble', 0.5);

            o.layout.Pots = [PtB; PtT];
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end