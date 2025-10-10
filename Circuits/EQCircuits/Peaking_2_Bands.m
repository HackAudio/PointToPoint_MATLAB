classdef Peaking_2_Bands < Circuit 
    
    methods
        function [o] = Peaking_2_Bands
            
            o.layout.numNodes = 13;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);
            
            R1 = Resistor (2.7e3, 1, 2);
            R2 = Resistor (2.7e3, 4, 5);
            R3 = Resistor (470, 10, 13);
            R4 = Resistor (47e3, 11, 12);
            R5 = Resistor (1e3, 6, 7);
            R6 = Resistor (470, 6, 9);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6];

            C1 = Capacitor (1e-6, 3, 10);
            C2 = Capacitor (47e-9, 10, 11);
            C3 = Capacitor (10e-9, 8, 0);
            o.layout.Cs = [C1; C2; C3];

            OP1 = OPAmp (2, 4, 5);
            OP2 = OPAmp (11, 13, 13);
            OP3 = OPAmp (8, 9, 9);
            o.layout.OPAmps = [OP1; OP2; OP3];

            % Bass Frequency Pot
            VrBF = VariableResistor (1e6, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                12, 0, 'Bass Frequency', 0.5);

            % Treble Frequency Pot
            VrTF = VariableResistor (10e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                7, 8, 'Treble Frequency', 0.5);

            o.layout.VarRs = [VrBF; VrTF];

            % Bass Gain Pot
            PtBG = Potentiometer (10e3, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 3, 4, 'Bass Gain', 0.5);

            % Treble Gain Pot
            PtTG = Potentiometer (10e3, 4,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 6, 4, 'Treble Gain', 0.5);

            o.layout.Pots = [PtBG; PtTG];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end