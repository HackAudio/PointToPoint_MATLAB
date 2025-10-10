classdef Diode_Ge_High_Pass < Circuit 

    methods
        function [o] = Diode_Ge_High_Pass

            o.layout.numNodes = 3;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (2, 0);

            R1 = Resistor (1e3, 3, 0);
            o.layout.Rs = R1;

            C1 = Capacitor (10e-9, 1, 2);
            o.layout.Cs = C1;
            
            D1 = Diode (Semiconductor.GERMANIUM,...
               Configuration.MATCHEDPAIR,...
               2, 0);
            o.layout.Ds = D1;

            % Distortion Pot
            VrD = VariableResistor (2e6, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LOG,...
                2, 3, 'Distortion', 0.5);

            o.layout.VarRs = VrD;

            o.circuit = CircuitModel(o.layout);
        end
    end
end