classdef SallenKeyHPF_NoPot < Circuit 
    
    methods
        function [o] = SallenKeyHPF_NoPot()
            
            o.layout.numNodes = 4;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            
            R1 = Resistor(16e3,2,4);
            R2 = Resistor(16e3,3,0);
            o.layout.Rs = [R1; R2];
            
            C1 = Capacitor(0.01e-6,1,2);
            C2 = Capacitor(0.01e-6,2,3);
            o.layout.Cs = [C1; C2];
            
            o.layout.OPAmps = OPAmp(3,4,4);
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end


