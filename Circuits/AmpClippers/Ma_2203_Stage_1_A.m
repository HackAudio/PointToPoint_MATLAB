classdef Ma_2203_Stage_1_A < Circuit 
    
    methods
        function [o] = Ma_2203_Stage_1_A
            
            o.layout.numNodes = 6;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);
            o.layout.Vs = VoltageSource (500, 6);
            
            R1 = Resistor (470e3, 1, 2);
            R2 = Resistor (100e3, 6, 5);
            R3 = Resistor (10e3, 4, 0);
            o.layout.Rs = [R1; R2; R3];

            C1 = Capacitor (470e-12, 1, 2);
            C2 = Capacitor (1e-9, 2, 3);
            o.layout.Cs = [C1; C2];

            TUBE1 = Tube12AX7 (Model12AX7.EXH, 3, 5, 4);
            o.layout.Tube12AX7s = TUBE1;

            % Volume Pot
            PtV = Potentiometer (1e6, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 3, 0, 'Volume', 0.05);
            
            o.layout.Pots = PtV;

            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end