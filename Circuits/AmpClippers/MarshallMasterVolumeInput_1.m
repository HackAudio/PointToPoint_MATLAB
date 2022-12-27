classdef MarshallMasterVolumeInput_1 < Circuit 
    
    methods
        function [o] = MarshallMasterVolumeInput_1()
            
            o.layout.numNodes = 6;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(6,0);
            o.layout.Vs = VoltageSource(280,5); % Voltage, Node
            
            R1 = Resistor(68e3,1,2); % In->Grid
            R2 = Resistor(2.7e3,3,0);  % Cathode->Ground
            R3 = Resistor(100e3,4,5);  % Anode->Vs
            o.layout.Rs = [R1; R2; R3];

            C1 = Capacitor(0.68e-6,3,0); % Cathode->Ground
            C2 = Capacitor(0.0022e-6,4,6); % Anode->Pot
            o.layout.Cs = [C1; C2];
            
            model = Model12AX7.RSD1;  
            
            tube = Tube12AX7(model,2,4,3); % Grid, Anode, Cathode
            
            o.layout.Tube12AX7s = tube;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end