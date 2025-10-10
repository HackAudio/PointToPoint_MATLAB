classdef Mx_D_Plus < Circuit 
    
    methods
        function [o] = Mx_D_Plus
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (7, 0);
            
            R1 = Resistor (220e3, 3, 4);
            R2 = Resistor (1e6, 2, 5);
            R3 = Resistor (10e3, 6, 7);
            o.layout.Rs = [R1; R2; R3];

            C1 = Capacitor (47e-9, 2, 3);
            C2 = Capacitor (1e-6, 5, 6);
            C3 = Capacitor (1e-9, 7, 0);
            o.layout.Cs = [C1; C2; C3];

            OP1 = OPAmp (1, 2, 5);
            o.layout.OPAmps = OP1;

            D1 = Diode (Semiconductor.GERMANIUM,...
               Configuration.MATCHEDPAIR,...
               7, 0);
            o.layout.Ds = D1;

            % Distortion Pot
            VrD = VariableResistor (1e6, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4, 0, 'Distortion', 0.5);

            o.layout.VarRs = VrD;

            o.layout.Output = 1;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end
 			