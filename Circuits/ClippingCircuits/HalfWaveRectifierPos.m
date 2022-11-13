classdef HalfWaveRectifierPos < Circuit 
    methods
        function [o] = HalfWaveRectifierPos()
            
            o.layout.numNodes = 2;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(2,0);
            R = Resistor(10e9,2,0);
%             R = Resistor(1,2,0);
            o.layout.Rs = R;
            % more resistance = more amplitude to non-clipped waveform
            
            D1 = Diode(Semiconductor.SILICON,Configuration.SINGLE,1,2);

            o.layout.Ds = [D1];
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end