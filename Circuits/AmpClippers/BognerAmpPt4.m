classdef BognerAmpPt4 < Circuit 
   
    methods
        function [o] = BognerAmpPt4()
            
            o.layout.numNodes = 5;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            o.layout.Vs = VoltageSource(265,5); % Voltage, Node
            
            R1 = Resistor(500e3,1,2); 
            R2 = Resistor(500e3,2,0); 
            R3 = Resistor(1e3,3,0); 
            R4 = Resistor(500e3,4,5);
            o.layout.Rs = [R1; R2; R3 ; R4];
             
            model = Model12AX7.EXH;  % RSD1, RSD2, EHX
            
            tube = Tube12AX7(model,2,4,3); % Grid, Anode, Cathode
            
            o.layout.Tube12AX7s = tube;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end
