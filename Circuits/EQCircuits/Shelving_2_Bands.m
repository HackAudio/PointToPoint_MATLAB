classdef Shelving_2_Bands < Circuit 
    
    methods
        function [o] = Shelving_2_Bands
            
            o.layout.numNodes = 13;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (9, 0);
            
            R1 = Resistor (10e3, 1, 2);
            R2 = Resistor (10e3, 2, 3);
            R3 = Resistor (3.3e3, 3, 4);
            R4 = Resistor (3.3e3, 12, 13);
            R5 = Resistor (3.3e3, 6, 7);
            R6 = Resistor (3.3e3, 10, 11);
            R7 = Resistor (10e3, 3, 8);
            R8 = Resistor (10e3, 8, 9);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6; R7; R8];

            C1 = Capacitor (220e-9, 5, 0);
            C2 = Capacitor (10e-9, 3, 12);
            o.layout.Cs = [C1; C2];

            OP1 = OPAmp (0, 2, 3);
            OP2 = OPAmp (5, 6, 6);
            OP3 = OPAmp (12, 11, 11);
            OP4 = OPAmp (0, 8, 9);
            o.layout.OPAmps = [OP1; OP2; OP3; OP4];

            % Bass Frequency Pot
            VrBF = VariableResistor (10e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4, 5, 'Bass Frequency', 0.5);

            % Treble Frequency Pot
            VrTF = VariableResistor (10e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                13, 0, 'Treble Frequency', 0.5);

            o.layout.VarRs = [VrBF; VrTF];

            % Bass Gain Pot
            PtBG = Potentiometer (10e3, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 7, 8, 'Bass Gain', 0.5);

            % Treble Gain Pot
            PtTG = Potentiometer (10e3, 4,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 10, 8, 'Treble Gain', 0.5);

            o.layout.Pots = [PtBG; PtTG];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end