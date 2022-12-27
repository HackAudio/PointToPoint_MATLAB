
%%% NOT WORKING %%%

classdef MarshallSuperLeadToneTube < Circuit 
    
    methods
        function [o] = MarshallSuperLeadToneTube()
            
            o.layout.numNodes = 4;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            o.layout.Vs = VoltageSource(275,3); % Voltage, Node
            
            R1 = Resistor(1e3,1,2);    % In->Grid
            R2 = Resistor(100e3,4,0);  % Cathode->Ground
            o.layout.Rs = [R1; R2];
            
            model = Model12AX7.RSD1;  
            
            tube = Tube12AX7(model,2,3,4); % Grid, Anode, Cathode
            
            o.layout.Tube12AX7s = tube;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end