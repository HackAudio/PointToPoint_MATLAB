classdef FenderBlackfaceInput < Circuit 
    
    methods
        function [o] = FenderBlackfaceInput()
            
            o.layout.numNodes = 5;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            o.layout.Vs = VoltageSource(410,5); % Voltage, Node
            
            R1 = Resistor(68e3,1,2); % In->Grid
            R2 = Resistor(1.5e3,3,0);  % Cathode->Ground
            R3 = Resistor(100e3,4,5);  % Anode->Vs
            o.layout.Rs = [R1; R2; R3];

            C1 = Capacitor(25e-6,3,0); % Cathode->Ground
            o.layout.Cs = C1;
            
            model = Model12AX7.RSD1;  
            
            tube = Tube12AX7(model,2,4,3); % Grid, Anode, Cathode
            
            o.layout.Tube12AX7s = tube;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end