classdef Ba_HC30_Tonestack < Circuit 
    
    methods
        function [o] = Ba_HC30_Tonestack
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (6, 0);
            
            R1 = Resistor (100e3, 1, 2);
            R2 = Resistor (10e3, 4, 0);
            R3 = Resistor (1e3, 6, 7); 
            R4 = Resistor (56e3, 1, 0);
            o.layout.Rs = [R1; R2; R3; R4];
            
            C1 = Capacitor (50e-12, 1, 3);
            C2 = Capacitor (22e-9, 2, 4);
            C3 = Capacitor (22e-9, 2, 5);
            o.layout.Cs = [C1; C2; C3];
            
            % Volume Pot
            VrV = VariableResistor (1e6, 3,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                7, 0, 'Volume', 1);
            
            o.layout.VarRs = VrV;

            % Bass Pot
            PtB = Potentiometer (1.5e6, 1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LOG,...
                5, 4, 0, 'Bass', 1);

            % Treble Pot
            PtT = Potentiometer (1e6, 2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3, 6, 5, 'Treble', 1);
            
            o.layout.Pots = [PtB; PtT];
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end