classdef Bo_Ec_Tonestack < Circuit 
    
    methods
        function [o] = Bo_Ec_Tonestack 
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (4, 0);
            
            R1 = Resistor (33e3, 1, 3);
            o.layout.Rs = R1;
            
            C1 = Capacitor (470e-12, 1, 2);
            C2 = Capacitor (0.022e-6, 3, 5);
            C3 = Capacitor (0.022e-6, 3, 7);
            o.layout.Cs = [C1; C2; C3];
            
            % Bass Pot
            VrB = VariableResistor (1e6, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5, 6, 'Bass', 0);

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
                2, 4, 5, 'Treble', 0);
            
            o.layout.Pots = [PtM; PtT];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end