classdef Wa_9062A_Tonestack < Circuit 
    
    methods
        function [o] = Wa_9062A_Tonestack
            
            o.layout.numNodes = 9;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);
            
            R1 = Resistor (150e3, 7, 8);
            R2 = Resistor (680e3, 8, 9);
            R3 = Resistor (680e3, 9, 4);
            R4 = Resistor (100e3, 4, 5);
            R5 = Resistor (270e3, 3, 0);
            o.layout.Rs = [R1; R2; R3; R4; R5];
            
            C1 = Capacitor (0.001e-6, 2, 3);
            C2 = Capacitor (500e-12, 3, 4);
            C3 = Capacitor (0.0033e-6, 6, 0);
            C4 = Capacitor (0.0033e-6, 8, 0);
            C5 = Capacitor (0.001e-6, 9, 0);
            o.layout.Cs = [C1; C2; C3; C4; C5];

            % Bass Pot
            PtB = Potentiometer (500e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 7, 0, 'Bass', 1);

            % Treble Pot
            PtT = Potentiometer (500e3, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LOG,...
                3, 6, 0, 'Treble', 1);

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