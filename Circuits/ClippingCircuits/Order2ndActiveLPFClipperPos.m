classdef Order2ndActiveLPFClipperPos < Circuit 
    methods
        function [o] = Order2ndActiveLPFClipperPos()
            o.layout.numNodes = 5;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(5,0);
            % E-T has R1=10k;R2=10k;R3=5.5k;R4=10k
            % E-T says to make R1 = R2
            R1 = Resistor(10e3,1,2);
            R2 = Resistor(10e3,2,3);
            R3 = Resistor(5.55e3,4,0);
            R4 = Resistor(10e3,4,5);
            o.layout.Rs = [R1;R2;R3;R4];
            
            % E-T has C1=0.1e-6;C2=0.1e-6
            % E-T says to make C1 = C2
            C1 = Capacitor(100e-9,3,0);
            C2 = Capacitor(100e-9,2,5);
            o.layout.Cs = [C1;C2];
            
            OPA1 = OPAmp(3,4,5);
            o.layout.OPAmps = [OPA1];

            % Can add the diode at 2,0 and 3,0
            D1 = Diode(Semiconductor.SILICON,Configuration.SINGLE,2,0);
            o.layout.Ds = [D1];
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end