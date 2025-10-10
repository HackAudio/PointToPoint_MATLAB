classdef Br_Tonestack < Circuit 
    
    methods
        function [o] = Br_Tonestack 
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (4, 0);
            
            R1 = Resistor (38e3, 1, 2);
            R2 = Resistor (470e3, 3, 0);
            R3 = Resistor (470e3, 2, 6);
            R4 = Resistor (1e6, 4, 0);
            o.layout.Rs = [R1; R2; R3; R4];
            
            C1 = Capacitor (220e-12, 2, 3);
            C2 = Capacitor (1e-9, 6, 7);
            C3 = Capacitor (4.7e-9, 7, 0);
            C4 = Capacitor (4.7e-9, 4, 5);
            o.layout.Cs = [C1; C2; C3; C4];
            
            % Mid Pot
            PtM = Potentiometer (1e6, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5, 6, 7, 'Mid', 0.5);

            % Tilt Pot
            PtTi = Potentiometer (1e6, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3, 4, 6, 'Tilt', 0.6);
            
            o.layout.Pots = [PtM; PtTi];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end