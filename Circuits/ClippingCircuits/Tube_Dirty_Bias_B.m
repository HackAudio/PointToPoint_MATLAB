classdef Tube_Dirty_Bias_B < Circuit 
    
    methods
        function [o] = Tube_Dirty_Bias_B
            
            o.layout.numNodes = 6;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (3, 0);
            o.layout.Vs = VoltageSource (4.5, 5);
            
            R1 = Resistor (68e3, 1, 2);
            R2 = Resistor (3e3, 6, 3);
            R3 = Resistor (3e3, 4, 0);
            o.layout.Rs = [R1; R2; R3];

            TUBE1 = Tube12AX7 (Model12AX7.EXH, 2, 3, 4);
            o.layout.Tube12AX7s = TUBE1;

            % Bias Pot
            VrBI = VariableResistor (5e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5, 6, 'Bias', 0.5);

            o.layout.VarRs = VrBI;

            o.layout.hasDCBlocker = true;

            o.layout.Output = 1;
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end