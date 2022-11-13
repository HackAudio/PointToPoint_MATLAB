classdef MultipleFeedbackBPF_NoPot  < Circuit  
    methods
        function [o] =  MultipleFeedbackBPF_NoPot()
            
            o.layout.numNodes = 4;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            
            R1 = Resistor(22e3,1,2);
            R2 = Resistor(240,2,0);
            R3 = Resistor(220e3,3,4);
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor(0.01e-6,2,4);
            C2 = Capacitor(0.01e-6,2,3);
            o.layout.Cs = [C1; C2];
            
            o.layout.OPAmps = OPAmp(0,3,4);
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end
