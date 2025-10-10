classdef Jh_MG_Input < Circuit 
    
    methods
        function [o] = Jh_MG_Input
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);
            
            R1 = Resistor (2.2e6, 1, 0);
            R2 = Resistor (1e6, 2, 0);
            R3 = Resistor (4.7e3, 3, 7);
            R4 = Resistor (3.3e3, 3, 6);
            o.layout.Rs = [R1; R2; R3; R4];

            C1 = Capacitor (47e-9, 1, 2);
            C2 = Capacitor (47e-12, 3, 4);
            C3 = Capacitor (10e-9, 6, 7);
            C4 = Capacitor (10e-9, 7, 0);
            o.layout.Cs = [C1; C2; C3; C4];

            OP1 = OPAmp (2, 3, 4);
            o.layout.OPAmps = OP1;

            % Gain Pot
            PtG = Potentiometer (22e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3, 4, 5, 'Gain', 0);

            o.layout.Pots = PtG;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end