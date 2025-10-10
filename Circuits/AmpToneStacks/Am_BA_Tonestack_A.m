classdef Am_BA_Tonestack_A < Circuit 
    
    methods
        function [o] = Am_BA_Tonestack_A
            
            o.layout.numNodes = 13;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (13, 0);
            
            R1 = Resistor (4.7e3, 3, 4);
            R2 = Resistor (10e3, 2, 3);
            R3 = Resistor (2.2e3, 2, 5);
            R4 = Resistor (2.2e3, 7, 8);
            R5 = Resistor (4.7e3, 8, 0);
            R6 = Resistor (47e3, 9, 11);
            R7 = Resistor (100e3, 10, 0);
            R8 = Resistor (22e3, 11, 12);
            R9 = Resistor (22e3, 13, 0);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6; R7; R8; R9];
            
            C1 = Capacitor (1e-6, 4, 7);
            C2 = Capacitor (100e-12, 2, 3);
            C3 = Capacitor (2.2e-6, 5, 6);
            C4 = Capacitor (0.033e-6, 8, 9);
            C5 = Capacitor (0.033e-6, 9, 10);
            C6 = Capacitor (0.22e-6, 12, 13);
            o.layout.Cs = [C1; C2; C3; C4; C5; C6];

            OP1 = OPAmp (1, 2, 3);
            OP2 = OPAmp (10, 11, 11);

            o.layout.OPAmps = [OP1; OP2];

            % Volume Pot
            PtV = Potentiometer (50e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6, 0, 7, 'Volume', 1);

            o.layout.Pots = PtV;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end