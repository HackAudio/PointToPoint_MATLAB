classdef Vo_1901 < Circuit 
    
    methods
        function [o] = Vo_1901
            
            o.layout.numNodes = 11;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (9, 0);
            
            R1 = Resistor (10e3, 2, 3);
            R2 = Resistor (1e6, 3, 6);
            R3 = Resistor (1e6, 6, 0);
            R4 = Resistor (1e6, 4, 5);
            R5 = Resistor (12e3, 7, 8);
            R6 = Resistor (50e3, 11, 0);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6];

            C1 = Capacitor (0.001e-6, 1, 0);
            C2 = Capacitor (0.01e-6, 1, 2);
            C3 = Capacitor (16e-6, 6, 0);
            C4 = Capacitor (0.056e-6, 4, 10);
            C5 = Capacitor (16e-6, 5, 7);
            C6 = Capacitor (500e-12, 8, 0);
            o.layout.Cs = [C1; C2; C3; C4; C5; C6];

            OP1 = OPAmp (3, 4, 5);
            o.layout.OPAmps = OP1;

            D1 = Diode (Semiconductor.GERMANIUM,...
               Configuration.MATCHEDPAIR,...
               8, 0);
            o.layout.Ds = D1;

            % Distortion Pot
            VrD = VariableResistor (500e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                10, 11, 'Distortion', 1);

            o.layout.VarRs = VrD;

            % Output Pot
            PtV = Potentiometer (50e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                8, 9, 0, 'Output', 1);

            o.layout.Pots = PtV;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end