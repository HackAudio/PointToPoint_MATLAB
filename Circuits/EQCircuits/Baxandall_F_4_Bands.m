classdef Baxandall_F_4_Bands < Circuit 
    
    methods
        function [o] = Baxandall_F_4_Bands
            
            o.layout.numNodes = 18;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (18, 0);
            
            R1 = Resistor (1.6e3, 4, 5);
            R2 = Resistor (1.6e3, 1, 2);
            R3 = Resistor (22e3, 6, 7);
            R4 = Resistor (4.7e3, 7, 8);
            R5 = Resistor (180e3, 7, 5);
            R6 = Resistor (180e3, 1, 7);
            R7 = Resistor (3.3e3, 12, 18);
            R8 = Resistor (3.3e3, 5, 10);
            R9 = Resistor (22e3, 11, 13);
            R10 = Resistor (4.7e3, 13, 14);
            R11 = Resistor (1.6e3, 17, 18);
            R12 = Resistor (1.6e3, 5, 16);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6; R7; R8; R9; R10; R11; R12];

            C1 = Capacitor (22e-9, 2, 4);
            C2 = Capacitor (33e-9, 3, 6);
            C3 = Capacitor (2.2e-9, 8, 9);
            C4 = Capacitor (100e-9, 10, 12);
            C5 = Capacitor (2.2e-9, 14, 15);
            C6 = Capacitor (4.7e-9, 16, 17);
            o.layout.Cs = [C1; C2; C3; C4; C5; C6];

            OP1 = OPAmp (0, 7, 5);
            OP2 = OPAmp (0, 13, 18);
            o.layout.OPAmps = [OP1; OP2];

            % Low Pot
            PtL = Potentiometer (20e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                10, 11, 12, 'Low', 0.5);

            % Low Mid Pot
            PtLM = Potentiometer (20e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 3, 4, 'Low Mid', 0.5);

            % High Mid Pot
            PtHM = Potentiometer (20e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                16, 15, 17, 'High Mid', 0.5);

            % High Pot
            PtH = Potentiometer (20e3, 4,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1, 9, 5, 'High', 0.5);

            o.layout.Pots = [PtL; PtLM; PtHM; PtH];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end