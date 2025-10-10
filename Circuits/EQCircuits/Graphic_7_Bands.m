classdef Graphic_7_Bands < Circuit 
    
    methods
        function [o] = Graphic_7_Bands
            
            o.layout.numNodes = 32;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (4, 0);
            
            R1 = Resistor (2.7e3, 1, 2);
            R2 = Resistor (2.7e3, 3, 4);
            RA1 = Resistor (1.8e3, 6, 8);
            RA2 = Resistor (130e3, 7, 0);
            RB1 = Resistor (1.8e3, 10, 12);
            RB2 = Resistor (110e3, 11, 0);
            RC1 = Resistor (1.8e3, 14, 16);
            RC2 = Resistor (91e3, 15, 0);
            RD1 = Resistor (1.8e3, 18, 20);
            RD2 = Resistor (82e3, 19, 0);
            RE1 = Resistor (1.8e3, 22, 24);
            RE2 = Resistor (68e3, 23, 0);
            RF1 = Resistor (1.8e3, 26, 28);
            RF2 = Resistor (62e3, 27, 0);
            RG1 = Resistor (1.8e3, 30, 32);
            RG2 = Resistor (51e3, 31, 0);
            o.layout.Rs = [R1; R2; RA1; RA2; RB1; RB2; RC1; RC2;...
                           RD1; RD2; RE1; RE2; RF1; RF2; RG1; RG2];

            CA1 = Capacitor (1270e-9, 5, 6);
            CA2 = Capacitor (22e-9, 6, 7);
            CB1 = Capacitor (503e-9, 9, 10);
            CB2 = Capacitor (10e-9, 10, 11);
            CC1 = Capacitor (200e-9, 13, 14);
            CC2 = Capacitor (4.7e-9, 14, 15);
            CD1 = Capacitor (80e-9, 17, 18);
            CD2 = Capacitor (2.2e-9, 18, 19);
            CE1 = Capacitor (33e-9, 21, 22);
            CE2 = Capacitor (1e-9, 22, 23);
            CF1 = Capacitor (12.2e-9, 25, 26);
            CF2 = Capacitor (470e-12, 26, 27);
            CG1 = Capacitor (4.7e-9, 29, 30);
            CG2 = Capacitor (220e-12, 30, 31);
            o.layout.Cs = [CA1; CA2; CB1; CB2; CC1; CC2;...
                           CD1; CD2; CE1; CE2; CF1; CF2; CG1; CG2];

            OP1 = OPAmp (2, 3, 4);
            OPA = OPAmp (7, 8, 8);
            OPB = OPAmp (11, 12, 12);
            OPC = OPAmp (15, 16, 16);
            OPD = OPAmp (19, 20, 20);
            OPE = OPAmp (23, 24, 24);
            OPF = OPAmp (27, 28, 28);
            OPG = OPAmp (31, 32, 32);
            o.layout.OPAmps = [OP1; OPA; OPB; OPC; OPD; OPE; OPF; OPG];

            % 63 Hz Pot
            PtA = Potentiometer (10e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 5, 3, '63 Hz', 0.5);

            % 160 Hz Pot
            PtB = Potentiometer (10e3, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 9, 3, '160 Hz', 0.5);

            % 410 Hz Pot
            PtC = Potentiometer (10e3, 3,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 13, 3, '410 Hz', 0.5);

            % 1 kHz Pot
            PtD = Potentiometer (10e3, 4,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 17, 3, '1 kHz', 0.5);

            % 2.5 kHz Pot
            PtE = Potentiometer (10e3, 5,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 21, 3, '2.5 kHz', 0.5);

            % 7.7 kHz Pot
            PtF = Potentiometer (10e3, 6,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 25, 3, '7.7 kHz', 0.5);

            % 16 kHz Pot
            PtG = Potentiometer (10e3, 7,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 29, 3, '16 kHz', 0.5);

            o.layout.Pots = [PtA; PtB; PtC; PtD; PtE; PtF; PtG];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end