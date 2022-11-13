classdef TwinTNotchClipperPos < Circuit 
    methods
        function [o] = TwinTNotchClipperPos()
            o.layout.numNodes = 4;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);

            % R1 = R2
            % R3 = R1 / 2
            % R1 and R2 are inversely proportional to R3

            % For f = [100:15k]
            % R1=R2 = [470k:3k]
            % R3 =    [120k:750]
            r1 = 47e3;
            r2 = 12e3;
            R1 = Resistor(r1,1,2);
            R2 = Resistor(r1,2,4);
            R3 = Resistor(r2,3,0);
            o.layout.Rs = [R1;R2;R3];

            c = 5e-9;
            C1 = Capacitor(c,1,3);
            C2 = Capacitor(c,3,4);
            C3 = Capacitor(c,2,0);
            o.layout.Cs = [C1;C2;C3];

            % Clipper at 2,0
            % see scratch paper for resistor analysis
            % C = 5e-9

            D1 = Diode(Semiconductor.SILICON,Configuration.SINGLE,2,0);
            o.layout.Ds = [D1];
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end