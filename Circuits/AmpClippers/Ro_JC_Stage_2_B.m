classdef Ro_JC_Stage_2_B < Circuit 

    methods
        function [o] = Ro_JC_Stage_2_B

            o.layout.numNodes = 13;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (10, 0);

            R1 = Resistor (1e3, 1, 2);
            R2 = Resistor (47e3, 3, 4);
            R3 = Resistor (270e3, 5, 0);
            R4 = Resistor (3.9e3, 5, 6);
            R5 = Resistor (3.9e3, 6, 10);
            R6 = Resistor (1.5e6, 9, 0);
            R7 = Resistor (1e3, 3, 11);
            R8 = Resistor (50e3, 13, 9);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6; R7; R8];

            C1 = Capacitor (100e-12, 3, 4);
            C2 = Capacitor (0.082e-6, 4, 5);
            C3 = Capacitor (0.082e-6, 7, 9);
            C4 = Capacitor (1e-9, 8, 9);
            C5 = Capacitor (0.01e-6, 10, 9);
            C6 = Capacitor (0.01e-6, 11, 12);
            o.layout.Cs = [C1; C2; C3; C4; C5; C6];

            OP1 = OPAmp (2, 3, 4);
            o.layout.OPAmps = OP1;
            
            D1 = Diode (Semiconductor.SILICON,...
               Configuration.MATCHEDPAIR,...
               6, 7);
            D2 = Diode (Semiconductor.SILICON,...
               Configuration.MATCHEDPAIR,...
               10, 8);
            D3 = Diode (Semiconductor.SILICON,...
               Configuration.MATCHEDPAIR,...
               9, 0);

            o.layout.Ds = [D1; D2; D3];

            % Distortion Pot
            VrD = VariableResistor (50e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                12, 13, 'Distortion', 0.5);

            o.layout.VarRs = VrD;

            o.layout.Output = 0.96;

            o.circuit = CircuitModel(o.layout);
        end
    end
end