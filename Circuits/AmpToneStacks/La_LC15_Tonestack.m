classdef La_LC15_Tonestack < Circuit 
    
    methods
        function [o] = La_LC15_Tonestack
            
            o.layout.numNodes = 8;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (6, 0);
            
            R1 = Resistor (33e3, 1, 2);
            o.layout.Rs = R1;
            
            C1 = Capacitor (470e-12, 1, 3);
            C2 = Capacitor (22e-9, 2, 4);
            C3 = Capacitor (22e-9, 2, 5);
            o.layout.Cs = [C1; C2; C3];
            
            % Bass Pot
            VrB = VariableResistor (1e6, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4, 8, 'Bass', 0.05);
            
            o.layout.VarRs = VrB;

            % Mid Pot
            PtM = Potentiometer (22e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                8, 5, 0, 'Mid', 1);

            % Treble Pot
            PtT = Potentiometer (220e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                7, 3, 4, 'Treble', 0.05);

            % Volume Pot
            PtV = Potentiometer (1e6, 4,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3, 6, 0, 'Volume', 1);

            o.layout.Pots = [PtM; PtT; PtV];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end