classdef RatClipper < Circuit 
    
    methods
        function [o] = RatClipper()
            
            o.layout.numNodes = 10;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(10,0);
            voltage = 4.5; node = 7;
            Vs1 = VoltageSource(voltage,node);
            o.layout.Vs = [Vs1];
            
            R1 = Resistor(1e6,1,0);
            R2 = Resistor(1e6,2,7);  
            R3 = Resistor(1e3,2,3);
            R4 = Resistor(47,4,5);
            R5 = Resistor(18e3,5,10);  
            R6 = Resistor(470,6,0);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6]
            
            C1 = Capacitor(22e-9,1,2);
            C2 = Capacitor(1e-9,3,0);
            C3 = Capacitor(100e-12,4,8);
            C4 = Capacitor(2.2e-6,5,0);
            C5 = Capacitor(4.7e-6,6,0);
            C6 = Capacitor(4.7e-6,8,9);
            o.layout.Cs = [C1; C2; C3; C4; C5; C6];
            
            D1 = Diode(Semiconductor.SILICON,Configuration.MATCHEDPAIR,10,0);
            o.layout.Ds = [D1];

            OPA1 = OPAmp(3,4,8);
            o.layout.OPAmps = [OPA1];
            
            Vr1 = VariableResistor(100e3,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LOG ,...
                4,8);
            o.layout.VarRs = [Vr1];
            
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end

