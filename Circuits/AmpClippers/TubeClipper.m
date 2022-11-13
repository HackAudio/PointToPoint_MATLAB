classdef TubeClipper < Circuit 
    
    methods
        function [o] = TubeClipper()
            
            o.layout.numNodes = 5;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(3,0);
            o.layout.Vs = VoltageSource(200,5); % Voltage, Node
            
            R1 = Resistor(5e3,1,2); % In->Grid
            R2 = Resistor(.1e3,4,0);  % Cathode->Ground
            R3 = Resistor(10e3,3,5);  % Anode->Vs
            o.layout.Rs = [R1; R2; R3];
            
            model = Model12AX7.RSD1;  
            
            tube = Tube12AX7(model,2,3,4); % Grid, Anode, Cathode
            
            o.layout.Tube12AX7s = tube;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end