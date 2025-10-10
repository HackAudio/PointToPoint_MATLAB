classdef Ma_4100_Tonestack < Circuit 
    
    methods
        function [o] = Ma_4100_Tonestack
            
            o.layout.numNodes = 8;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (7, 0);
            
            R1 = Resistor (4.7e3, 1, 2);
            R2 = Resistor (4.7e3, 3, 5);
            R3 = Resistor (100e3, 7, 0);
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor (0.22e-6, 2, 3);
            C2 = Capacitor (4.7e-9, 3, 4);
            C3 = Capacitor (0.22e-6, 5, 6);
            C4 = Capacitor (0.22e-6, 5, 8);
            o.layout.Cs = [C1; C2; C3; C4];

            % Bass Pot
            VrB = VariableResistor (100e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6, 8, 'Bass', 1);

            % Mid Pot
            VrM = VariableResistor (10e3, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                8, 0, 'Mid', 1);
            
            o.layout.VarRs = [VrB; VrM];

            % Treble Pot
            PtT = Potentiometer (20e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4, 7, 6, 'Treble', 0);

            o.layout.Pots = PtT;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end