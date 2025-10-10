classdef Am_B15_Stage_2_A < Circuit 
    
    methods
        function [o] = Am_B15_Stage_2_A
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);
            o.layout.Vs = VoltageSource (500, 6);
            
            R1 = Resistor (39e3, 2, 0);
            R2 = Resistor (2.2e3, 7, 0);
            R3 = Resistor (220e3, 5, 6);
            o.layout.Rs = [R1; R2; R3];

            C1 = Capacitor (0.02e-6, 1, 2);
            C2 = Capacitor (0.01e-6, 1, 3);
            o.layout.Cs = [C1; C2];

            TUBE1 = Tube12AX7 (Model12AX7.EXH, 4, 5, 7);
            o.layout.Tube12AX7s = TUBE1;

            % Volume Pot
            PtV = Potentiometer (1e6, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3, 4, 0, 'Volume', 0.05);
            
            o.layout.Pots = PtV;

            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end