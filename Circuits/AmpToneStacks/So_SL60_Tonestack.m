classdef So_SL60_Tonestack < Circuit 
    
    methods
        function [o] = So_SL60_Tonestack
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (4, 0);
            
            R1 = Resistor (100e3, 1, 0);
            R2 = Resistor (47e3, 1, 5);
            o.layout.Rs = [R1; R2];
            
            C1 = Capacitor (470e-12, 1, 2);
            C2 = Capacitor (22e-9, 5, 6);
            C3 = Capacitor (22e-9, 5, 7);
            o.layout.Cs = [C1; C2; C3];
            
            % Bass Pot
            VrB = VariableResistor (1e6, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6, 7, 'Bass', 1);

            % Mid Pot
            VrM = VariableResistor (30e3, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                7, 0, 'Mid', 1);
            
            o.layout.VarRs = [VrB; VrM];

            % Treble Pot
            PtT = Potentiometer (220e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 3, 6, 'Treble', 0.65);

            % Volume Pot
            PtV = Potentiometer (1e6, 4,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3, 4, 0, 'Volume', 1);

            o.layout.Pots = [PtT; PtV];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end