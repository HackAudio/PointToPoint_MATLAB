classdef Ma_G_Input < Circuit 
    
    methods
        function [o] = Ma_G_Input
            
            o.layout.numNodes = 6;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (6, 0);
            
            R1 = Resistor (2.2e6, 1, 0);
            R2 = Resistor (1e6, 2, 0);
            R3 = Resistor (2.2e3, 4, 3);
            o.layout.Rs = [R1; R2; R3];

            C1 = Capacitor (9.6e-9, 1, 2);
            C2 = Capacitor (100e-9, 4, 0);
            C3 = Capacitor (120e-12, 3, 5);
            o.layout.Cs = [C1; C2; C3];

            OP1 = OPAmp (2, 3, 5);
            o.layout.OPAmps = OP1;

            % Gain Pot
            PtG = Potentiometer (100e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3, 5, 6, 'Gain', 0);

            o.layout.Pots = PtG;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end