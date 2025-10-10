classdef Diode_Si_Hard_Clipper < Circuit 
    
    methods
        function [o] = Diode_Si_Hard_Clipper
            
            o.layout.numNodes = 3;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (2, 0);

            R1 = Resistor (10e3, 1, 2);
            o.layout.Rs = R1;
    
            D1 = Diode (Semiconductor.SILICON,...
               Configuration.MATCHEDPAIR,...
               2, 3);

            o.layout.Ds = D1;

            % Distortion Pot
            VrD = VariableResistor (100e3, 1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LOG,...
                3, 0, 'Distortion', 0.5);

            o.layout.VarRs = VrD;

            o.circuit = CircuitModel (o.layout);
        end
    end
end