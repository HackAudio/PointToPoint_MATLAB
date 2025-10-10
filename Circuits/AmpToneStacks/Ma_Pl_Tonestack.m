classdef Ma_Pl_Tonestack < Circuit 
    
    methods
        function [o] = Ma_Pl_Tonestack
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (3, 0);
            
            R1 = Resistor (33e3, 1, 5);
            o.layout.Rs = R1;
            
            C1 = Capacitor (500e-12, 1, 2);
            C2 = Capacitor (0.022e-6, 5, 4);
            C3 = Capacitor (0.022e-6, 5, 7);
            o.layout.Cs = [C1; C2; C3];
            
            % Bass Pot
            VrB = VariableResistor (1e6, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4, 6, 'Bass', 1);

            o.layout.VarRs = VrB;

            % Mid Pot
            PtM = Potentiometer (25e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6, 7, 0, 'Mid', 1);

            % Treble Pot
            PtT = Potentiometer (250e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 3, 4, 'Treble', 0.9);

            o.layout.Pots = [PtM; PtT];

            o.circuit = CircuitModel (o.layout);

        end
    end
end