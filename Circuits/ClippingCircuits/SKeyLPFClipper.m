classdef SKeyLPFClipper < Circuit
    methods
        function [o] = SKeyLPFClipper()
            o.layout.numNodes = 4;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            
            R1 = Resistor(1e3,1,2);
            R2 = Resistor(1e3,2,3);
            o.layout.Rs = [R1;R2];
            
            C1 = Capacitor(1e-9,2,4);
            C2 = Capacitor(1e-9,3,0);
            o.layout.Cs = [C1;C2];
            
            OPA1 = OPAmp(3,4,4);
            o.layout.OPAmps = [OPA1];

            % Clipping at 3,0 : C = 1e-9 ; R = 50e3
            % 2,0 : C = 1e-9 ; R = [1e3:1e6]
            % 2,4 : C = 22e-9 ; R1 = 100e3 ; R2 = 250e3
            % 2,3 : C = 22e-9 ; R = 250e3
            D1 = Diode(Semiconductor.SILICON,Configuration.MATCHEDPAIR,2,0);
            o.layout.Ds = [D1];
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end



%{
2,0 is viable for both SKey passive 1st order circuits

3,0 is viable for LPF, but does basically same thing as 2,0

2,3;2,4;3,4 all work for HPF but don't really do much either
%}



