classdef GuvnorClipping < Circuit 
    
    methods
        function [o] = GuvnorClipping()
            
            o.layout.numNodes = 10;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(10,0);
            voltage1 = 4.5; nodeV5 = 5;
            Vs1 = VoltageSource(voltage1,nodeV5);
            voltage2 = 4.5; nodeV7 = 7;
            Vs2 = VoltageSource(voltage2,nodeV7);
            o.layout.Vs = [Vs1; Vs2];
            
            R1 = Resistor(10e3,2,3);
            R2 = Resistor(4.7e3,4,5); 
            R3 = Resistor(680e3,6,8);
            R4 = Resistor(1e3,9,10);
            o.layout.Rs = [R1; R2; R3; R4];
            
            C1 = Capacitor(220.0e-9,1,2);
            C2 = Capacitor(100e-9,3,6);
            C3 = Capacitor(220e-12,6,8);
            C4 = Capacitor(220e-9,8,9);
            o.layout.Cs = [C1; C2; C3; C4];
            
            OPA1 = OPAmp(7,6,8);
            o.layout.OPAmps = [OPA1];
            
            D1 = Diode(Semiconductor.SILICON,Configuration.SINGLE,4,3);
            D1.setSaturationCurrent(10e-15);
            D1.setEmissionCoeff(1.0);
            
            D2 = Diode(Semiconductor.SILICON,Configuration.MATCHEDPAIR,10,0);
            D2.setSaturationCurrent(10e-15);
            D2.setEmissionCoeff(1.0);
            o.layout.Ds = [D1;D2]
            o.layout.hasDCBlocker = true;
            
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end
 