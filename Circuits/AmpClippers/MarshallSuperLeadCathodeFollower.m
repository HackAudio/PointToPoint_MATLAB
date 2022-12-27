
%%% NOT WORKING %%%

classdef MarshallSuperLeadCathodeFollower < Circuit 
    
    methods
        function [o] = MarshallSuperLeadCathodeFollower()
            
            o.layout.numNodes = 5;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            o.layout.Vs = VoltageSource(275,5); % Voltage, Node
            
            R1 = Resistor(1e3,1,2);     % In->Grid
            R2 = Resistor(1e3,3,0);     % Cathode->Ground
            R3 = Resistor(100e3,4,5);   % Anode->Vs
            o.layout.Rs = [R1; R2; R3];
            
            model = Model12AX7.RSD1;  
            
            tube1 = Tube12AX7(model,2,4,3); % Grid, Anode, Cathode

            o.layout.Tube12AX7s = tube1;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end