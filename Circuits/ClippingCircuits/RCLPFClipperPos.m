classdef RCLPFClipperPos < Circuit 
    % RC LPF positive clipper 
    methods
        function [o] = RCLPFClipperPos()
            
            o.layout.numNodes = 2;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(2,0);
            R = Resistor(10e3,1,2);
            % adjust resistor to change clipping amplitude
            % more resistance = more clipping
            o.layout.Rs = R;
            % starts to do stuff at 1e-8 and above
            % I like it at 1e-6
            C = Capacitor(.1e-9,2,0);
            o.layout.Cs = C;
            
            D1 = Diode(Semiconductor.SILICON,Configuration.SINGLE,2,0);

            o.layout.Ds = [D1];
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end