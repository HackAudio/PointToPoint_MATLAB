classdef SallenKey2ndOrderHPF_NoPot < Circuit 
    
    methods
        function [o] = SallenKey2ndOrderHPF_NoPot()
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(5,0);
            
            R1 = Resistor(8e3,2,5);
            R2 = Resistor(8e3,3,0);
            R3 = Resistor(10e3,4,5);
            R4 = Resistor(6e3,4,0);
            o.layout.Rs = [R1; R2; R3; R4];
            
            C1 = Capacitor(100e-9,1,2);
            C2 = Capacitor(1e-9,2,3);
            o.layout.Cs = [C1; C2];
            
            o.layout.OPAmps = OPAmp(3,4,5);
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end