classdef Bo_Ec_Stage_1 < Circuit 
    
    methods
        function [o] = Bo_Ec_Stage_1
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (4, 0);
            o.layout.Vs = VoltageSource (240, 5);
            
            R1 = Resistor (68e3, 1, 2);
            R2 = Resistor (820, 3, 0);
            R3 = Resistor (100e3, 4, 5);
            o.layout.Rs = [R1; R2; R3];

            C1 = Capacitor (0.68e-6, 3, 0);
            o.layout.Cs = C1;

            TUBE1 = Tube12AX7 (Model12AX7.EXH, 2, 4, 3);
            o.layout.Tube12AX7s = TUBE1;

            o.layout.hasDCBlocker = true;

            o.layout.Output = 0.64;
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end