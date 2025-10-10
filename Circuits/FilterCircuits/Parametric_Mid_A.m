classdef Parametric_Mid_A < Circuit 
    
    methods
        function [o] = Parametric_Mid_A
            
            o.layout.numNodes = 16;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);
            
            R1 = Resistor (4.7e3, 1, 3);
            R2 = Resistor (4.7e3, 3, 5);
            R3 = Resistor (6.8e3, 11, 12);
            R4 = Resistor (2.2e3, 2, 8);
            R5 = Resistor (4.7e3, 8, 13);
            R6 = Resistor (2.2e3, 4, 0);
            R7 = Resistor (2.2e3, 4, 13);
            R8 = Resistor (12e3, 9, 10);
            R9 = Resistor (12e3, 9, 16);
            R10 = Resistor (470, 7, 8);
            R11 = Resistor (4.7e3, 6, 9);
            R12 = Resistor (6.8e3, 14, 15);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6; R7; R8; R9; R10; R11; R12];

            C1 = Capacitor (10e-9, 12, 13);
            C2 = Capacitor (47e-9, 15, 16);
            o.layout.Cs = [C1; C2];

            OP1 = OPAmp (4, 3, 5);
            OP2 = OPAmp (8, 9, 10);
            OP3 = OPAmp (0, 12, 13);
            OP4 = OPAmp (0, 15, 16);
            o.layout.OPAmps = [OP1; OP2; OP3; OP4];

            % Frequency Pot
            VrF1 = VariableResistor (100e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                10, 11, 'Frequency', 0.5);

            VrF2 = VariableResistor (100e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                13, 14, 'Frequency', 0.5);

            o.layout.VarRs = [VrF1; VrF2];

            % Boost/Cut (Gain) Pot
            PtG = Potentiometer (10e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1, 2, 5, 'Gain', 0.5);

            % Q Pot
            PtQ = Potentiometer (100e3, 3,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LOG,...
                6, 0, 7, 'Q', 0.5);

            o.layout.Pots = [PtG; PtQ];
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end