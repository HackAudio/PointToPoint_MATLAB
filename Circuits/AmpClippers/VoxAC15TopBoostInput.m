classdef VoxAC15TopBoostInput < Circuit 
    
    methods
        function [o] = VoxAC15TopBoostInput()
            
            o.layout.numNodes = 7;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(5,0);
            o.layout.Vs = VoltageSource(450,6); % Voltage, Node
            
            R1 = Resistor(68e3,1,2); % In->Grid
            R2 = Resistor(1.5e3,3,0);  % Cathode->Ground
            R3 = Resistor(220e3,4,6);  % Anode->Vs
            R4 = Resistor(1e3,7,0);
            o.layout.Rs = [R1; R2; R3; R4];

            C1 = Capacitor(25e-6,3,0); % Cathode->Ground
            C2 = Capacitor(500e-12,4,5); % Anode->Pot
            o.layout.Cs = [C1; C2];

            P1A = VariableResistor(500e3,1,... % Volume
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5,7);
            o.layout.VarRs = P1A;
            
            model = Model12AX7.RSD1;  
            
            tube = Tube12AX7(model,2,4,3); % Grid, Anode, Cathode
            
            o.layout.Tube12AX7s = tube;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end