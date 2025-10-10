classdef Rectifier_Halfwave < Circuit

    methods
        function [o] = Rectifier_Halfwave
            
            o.layout.numNodes = 2;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (2, 0);

            % more resistance = more amplitude to non-clipped waveform
            R1 = Resistor (100e9, 2, 0);
            o.layout.Rs = R1;
            
            D1 = Diode (Semiconductor.SILICON,...
               Configuration.SINGLE,...
               1, 2);

            o.layout.Ds = D1;
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end