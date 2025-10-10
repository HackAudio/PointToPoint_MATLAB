classdef Ib_TS_Tone < Circuit 
    
    methods
        function [o] = Ib_TS_Tone
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (7, 0);
            
            R1 = Resistor (1e3, 1, 2);
            R2 = Resistor (10e3, 2, 0);
            R3 = Resistor (220, 6, 0);
            R4 = Resistor (1e3, 3, 4);
            R5 = Resistor (1e3, 4, 7);
            o.layout.Rs = [R1; R2; R3; R4; R5];

            C1 = Capacitor (0.22e-6, 2, 0);
            C2 = Capacitor (0.22e-6, 5, 6);
            o.layout.Cs = [C1; C2];

            OP1 = OPAmp (2, 3, 4);
            o.layout.OPAmps = OP1;

            % Tone Pot
            PtTo = Potentiometer (20e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 5, 3, 'Tone', 1);

            o.layout.Pots = PtTo;

            o.layout.hasDCBlocker = true;

            o.layout.Output = 1;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end