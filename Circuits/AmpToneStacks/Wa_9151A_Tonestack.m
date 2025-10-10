classdef Wa_9151A_Tonestack < Circuit 
    
    methods
        function [o] = Wa_9151A_Tonestack
            
            o.layout.numNodes = 10;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (10, 0);
            
            R1 = Resistor (270e3, 1, 3);
            R2 = Resistor (100e3, 3, 0);
            R3 = Resistor (150e3, 5, 6);
            R4 = Resistor (680e3, 6, 7);
            R5 = Resistor (680e3, 10, 7);
            R6 = Resistor (270e3, 8, 0);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6];
            
            C1 = Capacitor (0.02e-6, 1, 2);
            C2 = Capacitor (0.1e-6, 3, 0);
            C3 = Capacitor (0.001e-6, 4, 8);
            C4 = Capacitor (500e-12, 8, 10);
            C5 = Capacitor (0.005e-6, 9, 0);
            C6 = Capacitor (0.003e-6, 6, 0);
            C7 = Capacitor (0.001e-6, 7, 0);
            o.layout.Cs = [C1; C2; C3; C4; C5; C6; C7];
            
            % Treble Pot
            VrT = VariableResistor (500e3, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                8, 9, 'Treble', 1);

            o.layout.VarRs = VrT;

            % Bass Pot
            PtB = Potentiometer (500e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4, 5, 0, 'Bass', 1);

            % Volume Pot
            PtV = Potentiometer (500e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 4, 0, 'Volume', 1);

            o.layout.Pots = [PtB; PtV];

            o.circuit = CircuitModel (o.layout);

        end
    end
end