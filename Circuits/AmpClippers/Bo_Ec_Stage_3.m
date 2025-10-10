classdef Bo_Ec_Stage_3 < Circuit 
    
    methods
        function [o] = Bo_Ec_Stage_3
            
            o.layout.numNodes = 6;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);
            o.layout.Vs = VoltageSource (256, 6);
            
            R1 = Resistor (500e3, 1, 2);
            R2 = Resistor (500e3, 2, 0);
            R3 = Resistor (500e3, 2, 3);
            R4 = Resistor (10e3, 4, 0);
            R5 = Resistor (100e3, 5, 6);
            o.layout.Rs = [R1; R2; R3; R4; R5];

            C1 = Capacitor (470e-12, 2, 3);
            C2 = Capacitor (470e-12, 5, 6);
            o.layout.Cs = [C1; C2];

            TUBE1 = Tube12AX7 (Model12AX7.EXH, 3, 5, 4);
            o.layout.Tube12AX7s = TUBE1;

            o.layout.hasDCBlocker = true;

            o.layout.Output = 0.87;
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end