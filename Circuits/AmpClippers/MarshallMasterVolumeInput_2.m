
%%% NOT WORKING %%%

classdef MarshallMasterVolumeInput_2 < Circuit 
    
    methods
        function [o] = MarshallMasterVolumeInput_2()
            
            o.layout.numNodes = 8;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(8,0);
            o.layout.Vs = VoltageSource(280,7); % Voltage, Node
            
            R1 = Resistor(470e3,1,2); % 
            R2 = Resistor(1e3,3,4);  % In->Grid
            R3 = Resistor(10e3,5,0);  % Cathode->Ground
            R4 = Resistor(100e3,6,7); % Source->Anode
            R5 = Resistor(500e3,2,3); % Pot 1
            R6 = Resistor(500e3,3,0); % Pot 2
            o.layout.Rs = [R1; R2; R3; R4; R5; R6];

            C1 = Capacitor(470e-12,1,2);
            C2 = Capacitor(0.001e-6,2,3);
            C3 = Capacitor(0.022e-6,6,8);
            o.layout.Cs = [C1; C2; C3];
            
            model = Model12AX7.RSD1;  
            
            tube = Tube12AX7(model,4,6,5); % Grid, Anode, Cathode
            
            o.layout.Tube12AX7s = tube;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end