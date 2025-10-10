classdef So_SL100_Tonestack < Circuit 
    
    methods
        function [o] = So_SL100_Tonestack
            
            o.layout.numNodes = 8;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);
            
            R1 = Resistor (100e3, 1, 0);
            R2 = Resistor (47e3, 1, 2);
            o.layout.Rs = [R1; R2];
            
            C1 = Capacitor (470e-12, 1, 3);
            C2 = Capacitor (0.02e-6, 2, 6);
            C3 = Capacitor (0.02e-6, 2, 8);
            o.layout.Cs = [C1; C2; C3];
            
            % Bass Pot
            VrB = VariableResistor (1e6, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6, 7, 'Bass', 1);
            
            o.layout.VarRs = VrB;

            % Mid Pot
            PtM = Potentiometer (25e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                7, 8, 0, 'Mid', 1);

            % Treble Pot
            PtT = Potentiometer (250e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3, 4, 6, 'Treble', 0.65);

            % Volume Pot
            PtV = Potentiometer (1e6, 4,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4, 5, 0, 'Volume', 1);

            o.layout.Pots = [PtM; PtT; PtV];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end