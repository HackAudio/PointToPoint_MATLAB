classdef Transistor_NPN_Si < Circuit 
    
    methods
        function [o] = Transistor_NPN_Si
            
            o.layout.numNodes = 6;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (3, 0);
            o.layout.Vs = VoltageSource (9, 6);
            
            R1 = Resistor (1e3, 1, 2);
            R2 = Resistor (100e3, 4, 0);
            R3 = Resistor (1e3, 3, 5);
            o.layout.Rs = [R1; R2; R3];

            BJT1 = BJT(Doping.NPN,...
                 Semiconductor.SILICON,...
                 2, 3, 4);
            o.layout.BJTs = BJT1;

            % Bias Pot
            VrBI = VariableResistor(199e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5, 6, 'Bias', 1);

            o.layout.VarRs = VrBI;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end