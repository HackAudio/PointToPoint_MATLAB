classdef BognerAmpPt2 < Circuit 
   
    methods
        function [o] =  BognerAmpPt2()
            
            o.layout.numNodes = 5;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(3,0);
            o.layout.Vs = VoltageSource(250,4); % Voltage, Node
            
            R1 = Resistor(500e3,1,2); 
            R2 = Resistor(500e3,2,0); 
            R3 = Resistor(4.75e3,5,0); 
            R4 = Resistor(100e3,3,4);
            %R5 = Resistor(100e3,2,6);
            %o.layout.Rs = [R1; R2; R3; R4];
            o.layout.Rs = [R2; R3; R4];
            
            C1 = Capacitor(470e-12,1,2);
             
            C2 = Capacitor(0.001e-6,3,4);
            %o.layout.Cs = [C1];
            o.layout.Cs = [C1; C2]; 
             
            model = Model12AX7.RSD1;  % RSD1, RSD2, EXH
            
            tube = Tube12AX7(model,2,3,5); % Grid, Anode, Cathode
            
            o.layout.Tube12AX7s = tube;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end
 

