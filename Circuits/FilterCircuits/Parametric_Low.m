classdef Parametric_Low < Circuit 
    
    methods
        function [o] = Parametric_Low
            
            o.layout.numNodes = 8;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (8, 0);
            
            R1 = Resistor (22e3, 1, 7);
            R2 = Resistor (22e3, 7, 8);
            R3 = Resistor (7.5e3, 2, 3);
            R4 = Resistor (5.6e3, 3, 0);
            R5 = Resistor (6.8e3, 5, 6);
            o.layout.Rs = [R1; R2; R3; R4; R5];

            C1 = Capacitor (10e-9, 6, 0);
            o.layout.Cs = C1;

            OP1 = OPAmp (3, 4, 4);
            OP2 = OPAmp (6, 7, 8);
            o.layout.OPAmps = [OP1; OP2];

            % Boost/Cut (Gain) Pot
            PtG = Potentiometer (10e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1, 2, 8, 'Gain', 0.5);

            o.layout.Pots = PtG;

            % Frequency Pot
            VrF = VariableResistor (100e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4, 5, 'Frequency', 0.5);

            o.layout.VarRs = VrF;
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end