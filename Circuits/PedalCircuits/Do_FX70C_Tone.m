classdef Do_FX70C_Tone < Circuit 
    
    methods
        function [o] = Do_FX70C_Tone
            
            o.layout.numNodes = 14;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (12, 0);
            
            R1 = Resistor (100e3, 4, 0);
            R2 = Resistor (3.3e3, 3, 5);
            R3 = Resistor (2e3, 6, 7);
            R4 = Resistor (22e3, 8, 9);
            R5 = Resistor (100e3, 12, 0);
            R6 = Resistor (3e3, 10, 13);
            R7 = Resistor (1e3, 14, 8);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6; R7];

            C1 = Capacitor (0.22e-6, 2, 3);
            C2 = Capacitor (0.05e-6, 3, 4);
            C3 = Capacitor (10e-9, 7, 0);
            C4 = Capacitor (50e-12, 8, 9);
            C5 = Capacitor (10e-6, 9, 10);
            C6 = Capacitor (0.22e-6, 11, 12);
            o.layout.Cs = [C1; C2; C3; C4; C5; C6];

            OP1 = OPAmp (4, 5, 5);
            OP2 = OPAmp (1, 8, 9);
            o.layout.OPAmps = [OP1; OP2];

            % Bottom Pot
            PtB = Potentiometer (100e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1, 2, 8, 'Bottom', 0.5);

            % Top Pot
            PtT = Potentiometer (100e3, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1, 6, 14, 'Top', 0.5);

            % Dissolve Pot
            PtD = Potentiometer (100e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                13, 11, 0, 'Dissolve', 1);

            o.layout.Pots = [PtB; PtT; PtD];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end