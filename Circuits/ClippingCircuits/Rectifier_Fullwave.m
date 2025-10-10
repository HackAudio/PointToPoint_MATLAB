classdef Rectifier_Fullwave < Circuit 

    methods
        function [o] = Rectifier_Fullwave
            
            o.layout.numNodes = 3;
            o.layout.Vin = VoltageInput (1, 0);
            o.layout.Vout = VoltageOutput (2, 3);

            % more resistance = more amplitude to non-clipped waveform
            R1 = Resistor (100e9, 2, 3);
            o.layout.Rs = R1;
            
            D1 = Diode (Semiconductor.SILICON,...
               Configuration.SINGLE,...
               3, 1);
            D2 = Diode (Semiconductor.SILICON,...
               Configuration.SINGLE,...
               3, 0);
            D3 = Diode (Semiconductor.SILICON,...
               Configuration.SINGLE,...
               1, 2);
            D4 = Diode (Semiconductor.SILICON,...
               Configuration.SINGLE,...
               0, 2);

            o.layout.Ds = [D1; D2; D3; D4];
            
            o.circuit = CircuitModel (o.layout);
        end
    end
end