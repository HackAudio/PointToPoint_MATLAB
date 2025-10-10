classdef Wa_9056A_Tonestack < Circuit 
    
    methods
        function [o] = Wa_9056A_Tonestack
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);
            
            R1 = Resistor (22e3, 2, 3);
            R2 = Resistor (100e3, 5, 6);
            R3 = Resistor (6.8e3, 7, 0);
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor (0.0033e-6, 2, 4);
            C2 = Capacitor (0.1e-6, 3, 6);
            C3 = Capacitor (0.05e-6, 3, 7);
            o.layout.Cs = [C1; C2; C3];
            
            % Bass Pot
            VrB = VariableResistor (500e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6, 7, 'Bass', 1);

            % Treble Pot
            VrT = VariableResistor (500e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4, 5, 'Treble', 1);

            o.layout.VarRs = [VrB; VrT];

            % Volume Pot
            PtV = Potentiometer (500e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1, 2, 0, 'Volume', 1);

            o.layout.Pots = PtV;

            o.circuit = CircuitModel (o.layout);

        end
    end
end