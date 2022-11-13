classdef BognerAmpPt1 < Circuit 
   
    methods
        function [o] = BognerAmpPt1()
            
            o.layout.numNodes = 5;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(3,0);
            o.layout.Vs = VoltageSource(240,4); % Voltage, Node
            
            R1 = Resistor(68e3,1,2); 
            R2 = Resistor(100e3,3,4); 
            R3 = Resistor(820,5,0); 
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor(0.68e-6,5,0);
            o.layout.Cs = [C1]; 
             
            model = Model12AX7.EXH;  % RSD1, RSD2, EHX
            
            tube = Tube12AX7(model,2,3,5); % Grid, Anode, Cathode
            
            o.layout.Tube12AX7s = tube;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end
 

