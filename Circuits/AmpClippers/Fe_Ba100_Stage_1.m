classdef Fe_Ba100_Stage_1 < Circuit 
    
    methods
        function [o] = Fe_Ba100_Stage_1
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (4, 0);
            o.layout.Vs = VoltageSource (375, 5);
            
            R1 = Resistor (68e3, 1, 2);
            R2 = Resistor (1.068e6, 2, 0);
            R3 = Resistor (100e3, 4, 5);
            R4 = Resistor (1500, 3, 0);
            o.layout.Rs = [R1; R2; R3; R4];

            C1 = Capacitor (25e-9, 3, 0);
            o.layout.Cs = C1;

            TUBE1 = Tube12AX7 (Model12AX7.EXH, 2, 4, 3);
            o.layout.Tube12AX7s = TUBE1;

            o.layout.hasDCBlocker = true;

            o.layout.Output = 0.69;
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end