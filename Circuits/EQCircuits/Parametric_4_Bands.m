classdef Parametric_4_Bands < Circuit 
    
    methods
        function [o] = Parametric_4_Bands
            
            o.layout.numNodes = 22;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (8, 0);
            
            R1 = Resistor (2.7e3, 1, 2);
            R2 = Resistor (2.7e3, 7, 22);
            R3 = Resistor (100, 22, 8);
            R4 = Resistor (470, 9, 0);
            R5 = Resistor (470, 10, 13);
            R6 = Resistor (47e3, 11, 12);
            R7 = Resistor (470, 14, 17);
            R8 = Resistor (47e3, 15, 16);
            R9 = Resistor (470, 18, 21);
            R10 = Resistor (47e3, 19, 20);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6; R7; R8; R9; R10];

            C1 = Capacitor (12e-9, 6, 9);
            C2 = Capacitor (22e-9, 5, 10);
            C3 = Capacitor (10e-9, 10, 11);
            C4 = Capacitor (150e-9, 4, 18);
            C5 = Capacitor (22e-9, 18, 19);
            C6 = Capacitor (1e-6, 3, 14);
            C7 = Capacitor (47e-9, 14, 15);
            o.layout.Cs = [C1; C2; C3; C4; C5; C6; C7];

            OP1 = OPAmp (2, 7, 22);
            OP2 = OPAmp (15, 17, 17);
            OP3 = OPAmp (19, 21, 21);
            OP4 = OPAmp (11, 13, 13);
            o.layout.OPAmps = [OP1; OP2; OP3; OP4];

            % Bass Frequency Pot
            VrBF = VariableResistor (1e6, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                16, 0, 'Bass Frequency', 0.5);

            % Low Mid Frequency Pot
            VrLMF = VariableResistor (1e6, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                20, 0, 'Low Mid Frequency', 0.5);

            % High Mid Frequency Pot
            VrHMF = VariableResistor (1e6, 5,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                12, 0, 'High Mid Frequency', 0.5);

            o.layout.VarRs = [VrBF; VrLMF; VrHMF];

            % Bass Gain Pot
            PtBG = Potentiometer (10e3, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 3, 7, 'Bass Gain', 0.5);

            % Low Mid Gain Pot
            PtLMG = Potentiometer (10e3, 4,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 4, 7, 'Low Mid Gain', 0.5);

            % High Mid Gain Pot
            PtHMG = Potentiometer (10e3, 6,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 5, 7, 'High Mid Gain', 0.5);

            % Treble Gain Pot
            PtTG = Potentiometer (10e3, 7,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 6, 7, 'Treble Gain', 0.5);

            o.layout.Pots = [PtBG; PtLMG; PtHMG; PtTG];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end