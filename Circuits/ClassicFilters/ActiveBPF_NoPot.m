classdef ActiveBPF_NoPot < Circuit 
    
    %Unsure of component values
    methods
        function [o] = ActiveBPF_NoPot()
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(5,0);
            
            R1 = Resistor(100e3,2,0);
            R2 = Resistor(10e3,4,5);
            R3 = Resistor(100e3,3,0);
            R4 = Resistor(10e3,3,4);
            o.layout.Rs = [R1; R2; R3; R4];
            
            C1 = Capacitor(0.047e-6,1,2);
            C2 = Capacitor(1e-6,5,0);
            o.layout.Cs = [C1; C2];
            
            o.layout.OPAmps = OPAmp(2,3,4);
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end

