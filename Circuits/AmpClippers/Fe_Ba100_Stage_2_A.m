classdef Fe_Ba100_Stage_2_A < Circuit 
    
    methods
        function [o] = Fe_Ba100_Stage_2_A
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (7, 0);
            o.layout.Vs = VoltageSource (375, 6);
            
            R1 = Resistor (920, 4, 0);
            R2 = Resistor (100e3, 5, 6);
            R3 = Resistor (220e3, 5, 7);
            o.layout.Rs = [R1; R2; R3];

            C1 = Capacitor (0.047e-6, 1, 2);
            C2 = Capacitor (5e-9, 4, 0);
            o.layout.Cs = [C1; C2];

            TUBE1 = Tube12AX7 (Model12AX7.EXH, 3, 5, 4);
            o.layout.Tube12AX7s = TUBE1;

            % Gain Pot
            PtG = Potentiometer (1e6, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 3, 0, 'Gain', 1);
            
            o.layout.Pots = PtG;

            o.layout.hasDCBlocker = true;

            o.layout.Output = 0.67;
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end