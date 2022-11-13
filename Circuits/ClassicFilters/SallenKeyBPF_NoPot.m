classdef SallenKeyBPF_NoPot < Circuit 
   
    methods
        function [o] = SallenKeyBPF_NoPot()
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(7,0);
            
            R1 = Resistor(10000,2,4);
            R2 = Resistor(10000,3,0);
            R3 = Resistor(250,4,5);
            R4 = Resistor(250,5,6);
            o.layout.Rs = [R1; R2; R3; R4];
            
            C1 = Capacitor(22.0e-9,1,2);
            C2 = Capacitor(22.0e-9,2,3);
            C3 = Capacitor(47.0e-9,6,0);
            C4 = Capacitor(47.0e-9,5,7);
            o.layout.Cs = [C1; C2; C3; C4];
            
            OPA1 = OPAmp(3,4,4);
            OPA2 = OPAmp(6,7,7);
            o.layout.OPAmps = [OPA1; OPA2];

            o.circuit = CircuitModel(o.layout);

        end
    end
end
