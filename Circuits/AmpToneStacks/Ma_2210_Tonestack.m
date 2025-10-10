classdef Ma_2210_Tonestack < Circuit 
    
    methods
        function [o] = Ma_2210_Tonestack
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (3, 0);
            
            R1 = Resistor (56e3, 1, 4);
            R2 = Resistor (4.7e3, 5, 6);
            o.layout.Rs = [R1; R2];
            
            C1 = Capacitor (470e-12, 1, 2);
            C2 = Capacitor (22e-9, 4, 5);
            C3 = Capacitor (22e-9, 4, 7);
            C4 = Capacitor (2e-9, 5, 0);
            o.layout.Cs = [C1; C2; C3; C4];

            % Bass Pot
            VrB = VariableResistor (1e6, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6, 0, 'Bass', 0.75);

            % Mid Pot
            VrM = VariableResistor (100e3, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                7, 0, 'Mid', 1);
            
            o.layout.VarRs = [VrB; VrM];

            % Treble Pot
            PtT = Potentiometer (220e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 3, 5, 'Treble', 0.75);

            o.layout.Pots = PtT;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end