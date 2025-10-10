classdef Vo_Ac10 < Circuit 
    
    methods
        function [o] = Vo_Ac10
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (3, 0);
            o.layout.Vs = VoltageSource (255, 5);
            
            R1 = Resistor (220e3, 1, 2);
            R2 = Resistor (1e6, 2, 0);
            R3 = Resistor (820, 4, 0);
            R4 = Resistor (220e3, 3, 5);
            o.layout.Rs = [R1; R2; R3; R4];

            C1 = Capacitor (25e-9, 4, 0);
            o.layout.Cs = C1;

            TUBE1 = Tube12AX7 (Model12AX7.EXH, 2, 3, 4);
            o.layout.Tube12AX7s = TUBE1;

            o.layout.hasDCBlocker = true;

            o.layout.Output = 0.64;
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end