classdef MXRopamp < Circuit 
    
    methods
        function [o] = MXRopamp()
            
            o.layout.numNodes = 8;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(5,0);
            
            voltage = 4.5; node = 8;
            Vs1 = VoltageSource(voltage,node);
            o.layout.Vs = [Vs1];
            
            
            R1 = Resistor(10e3,2,3);
            R2 = Resistor(1e6,3,8);
            R3 = Resistor(4700,6,7);
            R4 = Resistor(1e6,4,5);
            o.layout.Rs = [R1 ; R2; R3; R4];
            
            C1 = Capacitor(1e-9,1,0);
            C2 = Capacitor(10e-9,1,2);
            C3 = Capacitor(47e-9,4,6);
            o.layout.Cs = [C1 ; C2; C3];
            
            OPA1 = OPAmp(3,4,5);
            o.layout.OPAmps = [OPA1];
            
            Vr1 = VariableResistor(1e6,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LOG,...
                7,0);
            
            o.layout.VarRs = [Vr1];
            
            o.circuit = CircuitModel(o.layout);
        end
        
    end
end

