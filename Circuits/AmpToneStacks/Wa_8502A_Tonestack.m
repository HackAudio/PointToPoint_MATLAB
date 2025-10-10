classdef Wa_8502A_Tonestack < Circuit 
    
    methods
        function [o] = Wa_8502A_Tonestack
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (4, 0);
            
            R1 = Resistor (68e3, 1, 2);
            R2 = Resistor (15e6, 4, 0);
            o.layout.Rs = [R1; R2];
            
            C1 = Capacitor (0.01e-6, 2, 5);
            C2 = Capacitor (0.02e-6, 3, 4);
            o.layout.Cs = [C1; C2];
            
            % Tone Pot
            VrTo = VariableResistor (1e6, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LOG,...
                5, 0, 'Tone', 1);

            o.layout.VarRs = VrTo;

            % Volume Pot
            PtV = Potentiometer (350e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2, 3, 0, 'Volume', 1);
            
            o.layout.Pots = PtV;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end