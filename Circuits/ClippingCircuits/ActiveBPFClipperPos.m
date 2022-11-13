classdef ActiveBPFClipperPos < Circuit
    % Active BPF positive clipper
    methods
        function [o] = ActiveBPFClipperPos()
            o.layout.numNodes = 5;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(5,0);
            % E-T has R1=10k;R2=10k;R3=5.5k;R4=10k
            % Gain amplitude = R3/R2
            % E-T says to make R1 = R4 ???
            
            % R1=100k ; R2=20k ; R3=25k ; R4=10k
            R1 = Resistor(12e3,2,0); % low cut off; higher R = lower freq
            R2 = Resistor(10e3,3,0);
            R3 = Resistor(10e3,3,4);
            R4 = Resistor(500,4,5); % high cut-off; higher R = lower freq
            o.layout.Rs = [R1;R2;R3;R4];
            
            % E-T has C1=0.1e-6;C2=0.1e-6
            % E-T says to make C1 = C2
            C1 = Capacitor(.1e-6,1,2);
            C2 = Capacitor(.1e-6,5,0);
            o.layout.Cs = [C1;C2];
            
            OPA1 = OPAmp(2,3,4);
            o.layout.OPAmps = [OPA1];

            % Can add the diode at 2,0 and 5,0
            % I like the 5,0 clipping more -Dan
            D1 = Diode(Semiconductor.SILICON,Configuration.SINGLE,5,0);
            o.layout.Ds = [D1];
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end