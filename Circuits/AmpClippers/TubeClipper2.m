classdef TubeClipper2 < Circuit 
    % Based on schematic from Santagata, Sarti, Tubaro 2007
    % "Nonlinear digital implementation of a parmeteric analog tube ground
    % cathode amplifier" DAFx-07
    methods
        function [o] = TubeClipper2()
            
            o.layout.numNodes = 4;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(2,0);
            o.layout.Vs = VoltageSource(150,4); % Voltage, Node
            
            R1 = Resistor(90e3,3,4); % Anode->V1
            R2 = Resistor(50,3,0);  % Cathode->Ground
            R3 = Resistor(200e3,2,0);  % Anode->Ground
            o.layout.Rs = [R1; R2; R3];
            
            model = Model12AX7.EXH;  % RSD1, RSD2, EHX
            
            tube = Tube12AX7(model,1,2,3); % Grid, Anode, Cathode
            
            o.layout.Tube12AX7s = tube;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end