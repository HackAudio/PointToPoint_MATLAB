classdef Jh_MG_Tone < Circuit 
    
    methods
        function [o] = Jh_MG_Tone
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (7, 0);
            
            R1 = Resistor (1e3, 1, 2);
            R2 = Resistor (6.8e3, 3, 5);
            R3 = Resistor (100e3, 5, 0);
            R4 = Resistor (68e3, 6, 7);
            R5 = Resistor (1e6, 7, 0);
            o.layout.Rs = [R1; R2; R3; R4; R5];

            C1 = Capacitor (10e-9, 4, 0);
            C2 = Capacitor (100e-9, 5, 6);
            C3 = Capacitor (10e-9, 5, 0);
            o.layout.Cs = [C1; C2; C3];

            % Tone Pot
            PtTo = Potentiometer (25e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 3, 4, 'Tone', 0.5);

            o.layout.Pots = PtTo;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end