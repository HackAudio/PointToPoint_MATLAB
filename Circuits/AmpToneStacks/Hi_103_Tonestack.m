classdef Hi_103_Tonestack < Circuit 
    
    methods
        function [o] = Hi_103_Tonestack 
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput (1,0);
            o.layout.Vout = VoltageOutput (3,0);
            
            R1 = Resistor (100e3, 1, 4);
            R2 = Resistor (10e3, 4, 5);
            o.layout.Rs = [R1; R2];
            
            C1 = Capacitor (220e-12, 1, 2);
            C2 = Capacitor (0.047e-6, 5, 0);
            o.layout.Cs = [C1; C2];
            
            % Bass Pot
            PtB = Potentiometer (1e6, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4, 5, 0, 'Bass', 0.5);

            % Treble Pot
            PtT = Potentiometer (250e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 3, 4, 'Treble', 0.5);

            o.layout.Pots = [PtB; PtT];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end