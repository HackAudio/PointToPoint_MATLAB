classdef MarshallSuperLeadNormalInput < Circuit 
    
    methods
        function [o] = MarshallSuperLeadNormalInput()
            
            o.layout.numNodes = 8;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(7,0);
            o.layout.Vs = VoltageSource(260,5); % Voltage, Node
            
            R1 = Resistor(68e3,1,2); % In->Grid
            R2 = Resistor(820,3,0);  % Cathode->Ground
            R3 = Resistor(100e3,4,5);  % Anode->Vs
            R4 = Resistor(1e3,8,0);
            o.layout.Rs = [R1; R2; R3; R4];

            C1 = Capacitor(330e-6,3,0); % Cathode->Ground
            C2 = Capacitor(0.022e-6,4,6); % Anode->Pot
            o.layout.Cs = [C1; C2];

            P1A = VariableResistor(1e6,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6,7);
            P1B = VariableResistor(1e6,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                7,8);
            o.layout.VarRs = [P1A; P1B;];
            
            model = Model12AX7.RSD1;  
            
            tube = Tube12AX7(model,2,4,3); % Grid, Anode, Cathode
            
            o.layout.Tube12AX7s = tube;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end