classdef Bo_DS1_Gain_Stage < Circuit 
    
    methods
        function [o] = Bo_DS1_Gain_Stage
            
            o.layout.numNodes = 9;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (8, 0);
            o.layout.Vs = VoltageSource (4.5, 9);
            
            R1 = Resistor (100e3, 2, 3);
            R2 = Resistor (4.7e3, 5, 6);
            R3 = Resistor (220e3, 4, 7);
            o.layout.Rs = [R1; R2; R3];

            C1 = Capacitor (100e-12, 3, 4);
            C2 = Capacitor (0.47e-6, 6, 0);
            C3 = Capacitor (0.47e-6, 7, 8);
            C4 = Capacitor (100e-12, 8, 9);
            o.layout.Cs = [C1; C2; C3; C4];

            OP1 = OPAmp (1, 2, 4);
            o.layout.OPAmps = OP1;

            D1 = Diode (Semiconductor.SILICON,...
               Configuration.MATCHEDPAIR,...
               8, 9);
            o.layout.Ds = D1;

            % Distortion Pot
            PtD = Potentiometer (100e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5, 3, 4, 'Distortion', 1);

            o.layout.Pots = PtD;

            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end