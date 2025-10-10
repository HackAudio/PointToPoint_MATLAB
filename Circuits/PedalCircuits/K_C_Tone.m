classdef K_C_Tone < Circuit 
    
    methods
        function [o] = K_C_Tone
            
            o.layout.numNodes = 6;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (6, 0);
            
            R1 = Resistor (100e3, 1, 4);
            R2 = Resistor (1.8e3, 1, 2);
            R3 = Resistor (100e3, 4, 6);
            R4 = Resistor (4.7e3, 5, 6);
            o.layout.Rs = [R1; R2; R3; R4];

            C1 = Capacitor (3.9e-9, 3, 4);
            o.layout.Cs = C1;

            OP1 = OPAmp (0, 4, 6);
            o.layout.OPAmps = OP1;

            % Treble Pot
            PtT = Potentiometer (10e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 3, 5, 'Treble', 1);

            o.layout.Pots = PtT;
            
            o.layout.Output = 0.97;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end