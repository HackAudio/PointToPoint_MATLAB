classdef ClippingCircuitTester < Circuit 
    methods
        function [o] = ClippingCircuitTester()

            o.layout.numNodes = 4;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(2,0);
            V1 = VoltageSource(-0.01,3);
            V2 = VoltageSource(0.01,4);
            o.layout.Vs = [V1;V2];
            
            R1 = Resistor(1e6,1,2);
            o.layout.Rs = [R1];
            
%             C1 = Capacitor(10e-9,1,2);
%             C2 = Capacitor(.1e-6,2,3);
%             o.layout.Cs = [C1];
            
%             OPA1 = OPAmp(1,3,2);
%             o.layout.OPAmps = [OPA1];

            D1 = Diode(Semiconductor.SILICON,Configuration.SINGLE,2,3);
            D2 = Diode(Semiconductor.SILICON,Configuration.SINGLE,4,2);
            o.layout.Ds = [D1;D2];
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end