classdef All_Pass < Circuit 
    
    methods
        function [o] = All_Pass
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (4, 0);
            
            R1 = Resistor (1e3, 1, 5);
            R2 = Resistor (10e3, 1, 3);
            R3 = Resistor (10e3, 3, 4);
            o.layout.Rs = [R1; R2; R3];

            C1 = Capacitor (10e-9, 2, 0);
            o.layout.Cs = C1;

            OP1 = OPAmp (2, 3, 4);
            o.layout.OPAmps = OP1;

            % Phase Pot
            VrP = VariableResistor (50e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5, 2, 'Phase', 0);

            o.layout.VarRs = VrP;

            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end