classdef Ma_G_Output < Circuit 
    
    methods
        function [o] = Ma_G_Output
            
            o.layout.numNodes = 3;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (3, 0);
            
            R1 = Resistor (22e3, 2, 3);
            o.layout.Rs = R1;

            C1 = Capacitor (470e-12, 3, 0);
            o.layout.Cs = C1;

            % Volume Pot
            PtV = Potentiometer (100e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1, 2, 0, 'Volume', 1);

            o.layout.Pots = PtV;
            
            o.circuit = CircuitModel (o.layout);

        end
    end
end