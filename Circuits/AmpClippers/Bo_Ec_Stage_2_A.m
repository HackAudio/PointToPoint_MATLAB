classdef Bo_Ec_Stage_2_A < Circuit 
    
    methods
        function [o] = Bo_Ec_Stage_2_A
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (4, 0);
            o.layout.Vs = VoltageSource (256, 5);
            
            R1 = Resistor (470e3, 1, 2);
            R2 = Resistor (500e3, 2, 0);
            R3 = Resistor (4.75e3, 3, 0);
            R4 = Resistor (100e3, 4, 5);
            o.layout.Rs = [R1; R2; R3; R4];

            C1 = Capacitor (470e-12, 1, 2);
            C2 = Capacitor (0.001e-6, 4, 5);
            o.layout.Cs = [C1; C2];

            TUBE1 = Tube12AX7 (Model12AX7.EXH, 2, 4, 3);
            o.layout.Tube12AX7s = TUBE1;

            o.layout.hasDCBlocker = true;

            o.layout.Output = 0.8;
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end