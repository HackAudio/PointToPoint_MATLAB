classdef Tilt < Circuit 
    
    methods
        function [o] = Tilt
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (7, 0);
            
            R1 = Resistor (6.8e3, 1, 3);
            R2 = Resistor (6.8e3, 5, 7);
            R3 = Resistor (2.2e3, 1, 2);
            R4 = Resistor (2.2e3, 6, 7);
            o.layout.Rs = [R1; R2; R3; R4];

            C1 = Capacitor (33e-9, 3, 6);
            C2 = Capacitor (33e-9, 2, 5);
            C3 = Capacitor (22e-12, 4, 7);
            o.layout.Cs = [C1; C2; C3];

            OP1 = OPAmp (0, 4, 7);
            o.layout.OPAmps = OP1;

            % Tilt Pot
            PtTi = Potentiometer (10e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3, 4, 5, 'Tilt', 0.5);

            o.layout.Pots = PtTi;
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end