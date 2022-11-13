classdef HalfWaveRectifierNegSC < Circuit 
   % Half wave rectifier negative circuit with smoothing capacitor
    methods
        function [o] = HalfWaveRectifierNegSC()
            
            o.layout.numNodes = 2;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(2,0);
            R = Resistor(10e6,2,0);
%             R = Resistor(1,2,0);
            o.layout.Rs = R;
            % more resistance = more amplitude to non-clipped waveform
            
            C = Capacitor(.022e-9,2,0);
            o.layout.Cs = C;

            D1 = Diode(Semiconductor.SILICON,Configuration.SINGLE,2,1);

            o.layout.Ds = [D1];
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end