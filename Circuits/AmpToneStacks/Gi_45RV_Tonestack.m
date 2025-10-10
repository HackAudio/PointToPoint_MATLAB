classdef Gi_45RV_Tonestack < Circuit 
    
    methods
        function [o] = Gi_45RV_Tonestack
            
            o.layout.numNodes = 11;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (9, 0);
            
            R1 = Resistor (100e3, 2, 4);
            R2 = Resistor (22e3, 3, 0);
            R3 = Resistor (82e3, 5, 7);
            R4 = Resistor (82e3, 7, 9);
            R5 = Resistor (4.7e3, 8, 0);
            R6 = Resistor (39e3, 6, 8);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6];
            
            C1 = Capacitor (0.0022e-6, 11, 2);
            C2 = Capacitor (0.0015e-6, 2, 3);
            C3 = Capacitor (0.001e-6, 11, 10);
            C4 = Capacitor (0.01e-6, 5, 0);
            C5 = Capacitor (0.0047e-6, 5, 6);
            C6 = Capacitor (0.0047e-6, 6, 9);
            C7 = Capacitor (0.01e-6, 7, 8);
            C8 = Capacitor (0.01e-6, 1, 11);
            o.layout.Cs = [C1; C2; C3; C4; C5; C6; C7; C8];

            % Bass Pot
            PtB = Potentiometer (1e6, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                11, 2, 3, 'Bass', 1);

            % Treble Pot
            PtT = Potentiometer (1e6, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LOG,...
                10, 4, 5, 'Treble', 1);

            % Volume Pot
            PtV = Potentiometer (1e6, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4, 5, 0, 'Volume', 1);
            
            o.layout.Pots = [PtB; PtT; PtV];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end