classdef Bo_DS1_Tone < Circuit 
    
    methods
        function [o] = Bo_DS1_Tone
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (7, 0);
            
            R1 = Resistor (6.8e3, 1, 2);
            R2 = Resistor (2.2e3, 3, 5);
            R3 = Resistor (6.8e3, 5, 0);
            R4 = Resistor (10e3, 6, 7);
            o.layout.Rs = [R1; R2; R3; R4];

            C1 = Capacitor (0.022e-6, 1, 3);
            C2 = Capacitor (0.1e-6, 2, 0);
            o.layout.Cs = [C1; C2];

            % Tone Pot
            PtT = Potentiometer (20e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 4, 5, 'Tone', 0.5);
    
            % Volume Pot
            PtV = Potentiometer (100e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4, 6, 0, 'Volume', 1);

            o.layout.Pots = [PtT; PtV];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end