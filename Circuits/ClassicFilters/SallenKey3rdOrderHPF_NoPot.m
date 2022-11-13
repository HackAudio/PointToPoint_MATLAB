classdef SallenKey3rdOrderHPF_NoPot < Circuit 
    
    methods
        function [o] = SallenKey3rdOrderHPF_NoPot()
            
            o.layout.numNodes = 6;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(6,0);
            
            R1 = Resistor(3300,2,0);
            R2 = Resistor(1600,4,6);
            R3 = Resistor(6800,5,0);
            o.layout.Rs = [R1; R2];
            
            C1 = Capacitor(470.0e-9,1,2);
            C2 = Capacitor(470.0e-9,3,4);
            C3 = Capacitor(470.0e-9,4,5);
            o.layout.Cs = [C1; C2; C3];
            
            OPA1 = OPAmp(2,3,3);
            OPA2 = OPAmp(5,6,6);
            o.layout.OPAmps = [OPA1; OPA2];
            
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end

