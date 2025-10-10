classdef Fe_BF_Tonestack < Circuit 
    
    methods
        function [o] = Fe_BF_Tonestack
            
            o.layout.numNodes = 8;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);
            
            R1 = Resistor (38e3, 1, 2);
            R2 = Resistor (100e3, 2, 4);
            R3 = Resistor (6.8e3, 6, 0);
            R4 = Resistor (1e6, 5, 0);
            R5 = Resistor (70e3, 8, 5);
            o.layout.Rs = [R1; R2; R3; R4; R5];
            
            C1 = Capacitor (250e-12, 2, 3);
            C2 = Capacitor (100e-9, 4, 8);
            C3 = Capacitor (100e-9, 4, 6);
            C4 = Capacitor (5e-9, 7, 0);
            o.layout.Cs = [C1; C2; C3; C4];
            
            % Bass Pot
            VrB = VariableResistor (250e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                8, 6, 'Bass', 1);

            o.layout.VarRs = VrB;

            % Treble Pot
            PtT = Potentiometer (350e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3, 5, 7, 'Treble', 1);
            
            o.layout.Pots = PtT;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end