classdef Gi_5T_Tonestack < Circuit 
    
    methods
        function [o] = Gi_5T_Tonestack
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (5, 0);
            
            R1 = Resistor (220e3, 1, 2);
            R2 = Resistor (220e3, 2, 3);
            o.layout.Rs = [R1; R2];
            
            C1 = Capacitor (500e-12, 1, 3);
            C2 = Capacitor (0.01e-6, 1, 4);
            C3 = Capacitor (0.0047e-6, 2, 0);
            o.layout.Cs = [C1; C2; C3];

            % Tone Pot
            VrTo = VariableResistor (1e6, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4, 0, 'Tone', 0.5);
            
            o.layout.VarRs = VrTo;

            % Volume Pot
            PtV = Potentiometer (1e6, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3, 5, 0, 'Volume', 1);
            
            o.layout.Pots = PtV;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end