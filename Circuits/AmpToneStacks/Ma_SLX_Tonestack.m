classdef Ma_SLX_Tonestack < Circuit 
    
    methods
        function [o] = Ma_SLX_Tonestack
            
            o.layout.numNodes = 8;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (4, 0);
            
            R1 = Resistor (1.2e3, 1, 2);
            R2 = Resistor (33e3, 2, 6);
            R3 = Resistor (500e3, 4, 0);
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor (470e-12, 2, 3);
            C2 = Capacitor (22e-9, 6, 5);
            C3 = Capacitor (22e-9, 6, 8);
            o.layout.Cs = [C1; C2; C3];
            
            % Bass Pot
            VrB = VariableResistor (220e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5, 7, 'Bass', 1);
            
            o.layout.VarRs = VrB;

            % Mid Pot
            PtM = Potentiometer (22e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                7, 8, 0, 'Mid', 1);

            % Treble Pot
            PtT = Potentiometer (220e3, 3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3, 4, 5, 'Treble', 0.5);

            o.layout.Pots = [PtM; PtT];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end