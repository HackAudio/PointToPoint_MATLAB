classdef Gi_75_Tonestack < Circuit 
    
    methods
        function [o] = Gi_75_Tonestack
            
            o.layout.numNodes = 8;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (7, 0);
            
            R1 = Resistor (47e3, 2, 3);
            R2 = Resistor (10e3, 5, 0);
            R3 = Resistor (100e3, 4, 7);
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor (0.0022e-6, 3, 4);
            C2 = Capacitor (0.022e-6, 4, 5);
            C3 = Capacitor (250e-12, 2, 6);
            C4 = Capacitor (0.022e-6, 8, 0);
            o.layout.Cs = [C1; C2; C3; C4];

            % Bass Pot
            PtB = Potentiometer (1e6, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3, 4, 5, 'Bass', 1);

            % Treble Pot
            PtT = Potentiometer (1e6, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6, 7, 8, 'Treble', 1);

            % Volume Pot
            PtV = Potentiometer (500e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1, 2, 0, 'Volume', 1);
            
            o.layout.Pots = [PtB; PtT; PtV];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end