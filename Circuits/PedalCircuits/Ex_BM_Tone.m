classdef Ex_BM_Tone < Circuit 
    
    methods
        function [o] = Ex_BM_Tone
            
            o.layout.numNodes = 4;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (3, 0);
            
            R1 = Resistor (39e3, 1, 4);
            R2 = Resistor (22e3, 2, 0);
            o.layout.Rs = [R1; R2];

            C1 = Capacitor (4e-9, 1, 2);
            C2 = Capacitor (10e-9, 4, 0);
            o.layout.Cs = [C1; C2];
    
            % Tone Pot
            PtTo = Potentiometer (100e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 3, 4, 'Tone', 0.5);

            o.layout.Pots = PtTo;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end