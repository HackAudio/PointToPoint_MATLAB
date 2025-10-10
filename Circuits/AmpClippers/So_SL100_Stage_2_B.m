classdef So_SL100_Stage_2_B < Circuit 
    
    methods
        function [o] = So_SL100_Stage_2_B
            
            o.layout.numNodes = 6;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);
            o.layout.Vs = VoltageSource (359, 6);
            
            R1 = Resistor (2.2e3, 4, 0);
            R2 = Resistor (100e3, 5, 6);
            R3 = Resistor (470e3, 1, 2);
            o.layout.Rs = [R1; R2; R3];

            TUBE1 = Tube12AX7 (Model12AX7.EXH, 3, 5, 4);
            o.layout.Tube12AX7s = TUBE1;

            % Gain Pot
            PtG = Potentiometer (500e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 3, 0, 'Gain', 0.05);
            
            o.layout.Pots = PtG;

            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end