classdef MultipleFeedbackLPF_NoPot  < Circuit  
    methods
        function [o] =  MultipleFeedbackLPF_NoPot()
            
            o.layout.numNodes = 4;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            
            R1 = Resistor(20e3,1,2);
            R2 = Resistor(20e3,2,4);
            R3 = Resistor(10e3,2,3);
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor(14.1e-9,2,0);
            C2 = Capacitor(3.54e-9,3,4);
            o.layout.Cs = [C1; C2];
            
            o.layout.OPAmps = OPAmp(0,3,4);
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end

