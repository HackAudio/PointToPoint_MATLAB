classdef BognerAmpPt5 < Circuit 
   
    methods
        function [o] = BognerAmpPt5()
            
            o.layout.numNodes = 3;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(3,0);
            o.layout.Vs = VoltageSource(265,2); % Voltage, Node
            
            R1 = Resistor(100e3,3,0);  
            o.layout.Rs = [R1];
             
            model = Model12AX7.EXH;  % RSD1, RSD2, EHX
            
            tube = Tube12AX7(model,1,2,3); % Grid, Anode, Cathode
            
            o.layout.Tube12AX7s = tube;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end

