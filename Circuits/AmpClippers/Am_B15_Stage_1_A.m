classdef Am_B15_Stage_1_A < Circuit 
    
    methods
        function [o] = Am_B15_Stage_1_A
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (4, 0);
            o.layout.Vs = VoltageSource (500, 5);
            
            R1 = Resistor (47e3, 1, 2);
            R2 = Resistor (5.6e6, 2, 0);
            R3 = Resistor (5.6e6, 3, 0);
            R4 = Resistor (470e3, 4, 5);
            o.layout.Rs = [R1; R2; R3; R4];

            TUBE1 = Tube12AX7 (Model12AX7.EXH, 2, 4, 3);
            o.layout.Tube12AX7s = TUBE1;

            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end