classdef Hi_Tonestack < Circuit 
    
    methods
        function [o] = Hi_Tonestack 
            
            o.layout.numNodes = 10;
            o.layout.Vin = VoltageInput (1,0);
            o.layout.Vout = VoltageOutput (10,0);
            
            R1 = Resistor (48e3, 1, 2);
            R2 = Resistor (100e3, 2, 5);
            R3 = Resistor (220e3, 3, 8);
            R4 = Resistor (22e3, 8, 7);
            R5 = Resistor (22e3, 9, 10);
            R6 = Resistor (220e3, 10, 0);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6];
            
            C1 = Capacitor (47e-9, 5, 0);
            C2 = Capacitor (1e-9, 2, 3);
            C3 = Capacitor (47e-9, 5, 6);
            C4 = Capacitor (220e-12, 3, 4);
            C5 = Capacitor (1e-9, 7, 6);
            o.layout.Cs = [C1; C2; C3; C4; C5];
            
            % Bass Pot
            VrB = VariableResistor (470e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6, 0, 'Bass', 1);

            % Mid Pot
            VrM = VariableResistor (100e3, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                7, 6, 'Mid', 1);

            o.layout.VarRs = [VrB; VrM];

            % Treble Pot
            PtT = Potentiometer (220e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4, 9, 8, 'Treble', 1);

            o.layout.Pots = PtT;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end