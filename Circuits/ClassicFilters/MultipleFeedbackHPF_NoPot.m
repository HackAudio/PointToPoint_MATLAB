classdef MultipleFeedbackHPF_NoPot  < Circuit  
    methods
        function [o] =  MultipleFeedbackHPF_NoPot()
            
            o.layout.numNodes = 4;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            
            R1 = Resistor(7.07e3,2,0);
            R2 = Resistor(28.32e3,3,4);
            o.layout.Rs = [R1; R2];
            
            C1 = Capacitor(5.0e-9,1,2);
            C2 = Capacitor(5.0e-9,2,4);
            C3 = Capacitor(10.0e-9,2,3);
            o.layout.Cs = [C1; C2; C3];
            
            o.layout.OPAmps = OPAmp(0,3,4);
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end
