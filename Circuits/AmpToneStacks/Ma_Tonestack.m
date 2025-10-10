classdef Ma_Tonestack < Circuit 
    
    methods
        function [o] =  Ma_Tonestack
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (7, 0);
            
            R1 = Resistor (1.3e3, 1, 2);
            R2 = Resistor (33e3, 2, 4);
            R3 = Resistor (517e3, 7, 0);
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor (470e-12, 2, 3);
            C2 = Capacitor (22e-9, 4, 5);
            C3 = Capacitor (22e-9, 4, 6);
            o.layout.Cs = [C1; C2; C3];

            % Bass Pot
            VrB = VariableResistor (1e6, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5, 6, 'Bass', 1);

            % Mid Pot
            VrM = VariableResistor (25e3, 2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6, 0, 'Mid', 1);
            
            o.layout.VarRs = [VrB; VrM];

            % Treble Pot
            PtT = Potentiometer (220e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3, 7, 5, 'Treble', 0.5);

            o.layout.Pots = PtT;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end