classdef MarshallJCM900_4100ToneStack_NoPot < Circuit 
    
    %Marshall JCM900 4100 Dual Reverb Boost Pre-Eq ToneStack
    methods
        function [o] = MarshallJCM900_4100ToneStack_NoPot
            
            o.layout.numNodes = 8;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(8,0);
            
            R1 = Resistor(4.7e3,1,2);
            R2 = Resistor(4.7e3,3,5);
            R3 = Resistor(10e3,4,8);
            R4 = Resistor(10e3,6,8);
            R5 = Resistor(100e3,6,7);
            R6 = Resistor(4.7e3,7,0);
            R7 = Resistor(100e3,8,0);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6; R7];
            
            C1 = Capacitor(4.7e-9,3,4);
            C2 = Capacitor(0.22e-6,5,6);
            C3 = Capacitor(0.22e-6,5,7);
            C4 = Capacitor(0.22e-6,2,3);
            o.layout.Cs = [C1; C2; C3; C4];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end
