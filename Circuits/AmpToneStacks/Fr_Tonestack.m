classdef Fr_Tonestack < Circuit 
    
    methods
        function [o] = Fr_Tonestack
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);
            
            R1 = Resistor (1e3, 1, 2);
            R2 = Resistor (100e3, 3, 0);
            R3 = Resistor (1e6, 5, 0);
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor (1e-9, 2, 3);
            C2 = Capacitor (1e-9, 3, 4);
            o.layout.Cs = [C1; C2];

            % Mid Pot
            PtM = Potentiometer (1e6, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 5, 4, 'Mid', 1);

            o.layout.Pots = PtM;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end