classdef Parametric_Mid_B < Circuit 
    
    methods
        function [o] = Parametric_Mid_B
            
            o.layout.numNodes = 8;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (8, 0);
            
            R1 = Resistor (6.8e3, 3, 4);
            R2 = Resistor (6.8e3, 6, 0);
            R3 = Resistor (22e3, 1, 7);
            R4 = Resistor (22e3, 7, 8);
            o.layout.Rs = [R1; R2; R3; R4];

            C1 = Capacitor (15e-9, 2, 3);
            C2 = Capacitor (6.8e-9, 5, 0);
            o.layout.Cs = [C1; C2];

            OP1 = OPAmp (5, 7, 8);
            o.layout.OPAmps = OP1;

            % Mid Pot
            PtM = Potentiometer (10e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1, 2, 8, 'Mids', 0.5);

            o.layout.Pots = PtM;

            % Frequency Pot
            VrF1 = VariableResistor (100e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LOG,...
                4, 5, 'Frequency', 0.5);

            VrF2 = VariableResistor (100e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LOG,...
                5, 6, 'Frequency', 0.5);

            o.layout.VarRs = [VrF1; VrF2];
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end