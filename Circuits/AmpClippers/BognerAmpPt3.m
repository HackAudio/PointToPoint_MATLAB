classdef BognerAmpPt3 < Circuit 
   
    methods
        function [o] = BognerAmpPt3()
            
            o.layout.numNodes = 5;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            o.layout.Vs = VoltageSource(256,5); % Voltage, Node
            
            R1 = Resistor(500e3,1,2); 
            R2 = Resistor(100e3,4,5); 
            R3 = Resistor(10e3,3,0); 
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor(470e-12,1,2);
            C2 = Capacitor(470e-12,4,5);
            %o.layout.Cs = [C2]; 
            o.layout.Cs = [C1; C2]; 
             
            model = Model12AX7.EXH;  % RSD1, RSD2, EHX
            
            tube = Tube12AX7(model,2,4,3); % Grid, Anode, Cathode
            
            o.layout.Tube12AX7s = tube;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end
 

