classdef FullWaveRectifierSC < Circuit % FWR with smoothing capacitor
    % Works? Getting warning messages...
    methods
        function [o] = FullWaveRectifierSC()
            
            o.layout.numNodes = 3;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(2,3);
            R = Resistor(100e3,2,3);
            o.layout.Rs = R;
            % more resistance = more amplitude
            % smoothing capacitor, works from about 1e-8 and higher
            % need to confirm a value to use
            C = Capacitor(.7e-9,2,3);
            o.layout.Cs = C;
            
            D1 = Diode(Semiconductor.SILICON,Configuration.SINGLE,3,1);
            D2 = Diode(Semiconductor.SILICON,Configuration.SINGLE,3,0);
            D3 = Diode(Semiconductor.SILICON,Configuration.SINGLE,1,2);
            D4 = Diode(Semiconductor.SILICON,Configuration.SINGLE,0,2);

            o.layout.Ds = [D1 ; D2 ; D3 ; D4];
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end