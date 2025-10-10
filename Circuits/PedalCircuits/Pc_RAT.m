classdef Pc_RAT < Circuit 
    
    methods
        function [o] = Pc_RAT
            
            o.layout.numNodes = 8;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (8, 0);
            
            R1 = Resistor (47, 1, 3);
            R2 = Resistor (560, 1, 4);
            R3 = Resistor (1e3, 5, 6);
            R4 = Resistor (1.5e3, 7, 8);
            o.layout.Rs = [R1; R2; R3; R4];

            C1 = Capacitor (2.2e-6, 3, 0);
            C2 = Capacitor (4.7e-6, 4, 0);
            C3 = Capacitor (100e-12, 1, 2);
            C4 = Capacitor (4.7e-6, 2, 5);
            C5 = Capacitor (3.3e-9, 8, 0);
            o.layout.Cs = [C1; C2; C3; C4; C5];

            D1 = Diode (Semiconductor.SILICON,...
               Configuration.MATCHEDPAIR,...
               6, 0);
            o.layout.Ds = D1;

            % Distortion Pot
            VrD = VariableResistor (100e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1, 2, 'Distortion', 1);

            % Tone Pot
            VrTo = VariableResistor (100e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6, 7, 'Tone', 1);

            o.layout.VarRs = [VrD; VrTo];

            o.layout.Output = 1;

            o.circuit = CircuitModel (o.layout);

        end
    end
end
 			