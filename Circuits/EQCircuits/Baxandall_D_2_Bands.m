classdef Baxandall_D_2_Bands < Circuit 
    
    methods
        function [o] = Baxandall_D_2_Bands
            
            o.layout.numNodes = 11;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (6, 0);
            
            R1 = Resistor (2.2e3, 11, 2);
            R2 = Resistor (2.2e3, 4, 5);
            R3 = Resistor (6.8e3, 3, 8);
            R4 = Resistor (2.2e3, 8, 9);
            R5 = Resistor (1.8e3, 5, 6);
            R6 = Resistor (1e3, 6, 7);
            R7 = Resistor (2.2e3, 5, 7);
            R8 = Resistor (1.3e3, 1, 11);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6; R7; R8];

            C1 = Capacitor (100e-9, 4, 3);
            C2 = Capacitor (100e-9, 2, 3);
            C3 = Capacitor (15e-9, 9, 10);
            o.layout.Cs = [C1; C2; C3];

            OP1 = OPAmp (0, 8, 6);
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
                11, 10, 5, 'Treble', 0.5);

            % Balance Pot
            PtBa = Potentiometer (10e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                0, 7, 6, 'Balance', 0.5);

            o.layout.Pots = [PtB; PtT; PtBa];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end