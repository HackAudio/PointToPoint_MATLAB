classdef Wa_9002A_Tonestack < Circuit 
    
    methods
        function [o] = Wa_9002A_Tonestack
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (7, 0);
            
            R1 = Resistor (15e3, 1, 2);
            R2 = Resistor (10e3, 1, 3);
            R3 = Resistor (10e3, 3, 4);
            R4 = Resistor (33e3, 2, 5);
            R5 = Resistor (33e3, 5, 6);
            o.layout.Rs = [R1; R2; R3; R4; R5];
            
            C1 = Capacitor (0.01e-6, 2, 0);
            C2 = Capacitor (0.0033e-6, 3, 5);
            o.layout.Cs = [C1; C2];
            
            % Tone Pot
            VrTo = VariableResistor (100e3, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4, 0, 'Tone', 1);

            o.layout.VarRs = VrTo;

            % Volume Pot
            PtV = Potentiometer (100e3, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6, 7, 0, 'Volume', 1);
            
            o.layout.Pots = PtV;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end