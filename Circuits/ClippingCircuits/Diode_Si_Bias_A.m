classdef Diode_Si_Bias_A < Circuit

    methods
        function [o] = Diode_Si_Bias_A
            
            o.layout.numNodes = 3;
            
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (2, 0);
            o.layout.Vs = VoltageSource (0.5, 3);

            R1 = Resistor (1e6, 2, 0);
            o.layout.Rs = R1;

            D1 = Diode (Semiconductor.SILICON,...
                Configuration.MATCHEDPAIR,...
                3, 2);

            o.layout.Ds = D1;

            % Bias Pot
            VrBI = VariableResistor (1e6, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LOG,...
                1, 2, 'Bias', 1);

            o.layout.VarRs = VrBI;

            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end