classdef Gi_20RV_Tonestack < Circuit 
    
    methods
        function [o] = Gi_20RV_Tonestack
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (6, 0);
            
            R1 = Resistor (60e3, 7, 2);
            R2 = Resistor (220e3, 4, 5);
            R3 = Resistor (220e3, 5, 6);
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor (0.0022e-6, 2, 0);
            C2 = Capacitor (0.01e-6, 3, 0);
            C3 = Capacitor (330e-12, 4, 6);
            C4 = Capacitor (0.0047e-6, 5, 0);
            C5 = Capacitor (0.0047e-6, 1, 7);
            o.layout.Cs = [C1; C2; C3; C4; C5];

            % Bass Pot
            VrB = VariableResistor (2e6, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LOG,...
                2, 0, 'Bass', 1);

            % Treble Pot
            VrT = VariableResistor (2e6, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LOG,...
                7, 3, 'Treble', 0);
            
            o.layout.VarRs = [VrB; VrT];

            % Volume Pot
            PtV = Potentiometer (250e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                7, 4, 0, 'Volume', 1);
            
            o.layout.Pots = PtV;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end