classdef MXRdistortion < Circuit 
    
    methods
        function [o] = MXRdistortion()
            
            o.layout.numNodes = 11;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(9,0);
            
            voltage = 4.5; node = 4;
            Vs1 = VoltageSource(voltage,node);
            o.layout.Vs = [Vs1];
            
            
            R1 = Resistor(10e3,2,3);
            R2 = Resistor(1e6,3,4);
            R3 = Resistor(4.7e3,10,11);
            R4 = Resistor(1e6,5,6);
            R5 = Resistor(10e3,7,8);
            o.layout.Rs = [R1 ; R2; R3; R4; R5];
            
            C1 = Capacitor(1e-9,1,0);
            C2 = Capacitor(10e-9,1,2);
            C3 = Capacitor(47e-9,5,10);
            C4 = Capacitor(1e-6,6,7);
            C5 = Capacitor(1e-9,8,0);
            o.layout.Cs = [C1 ; C2; C3; C4; C5];
            
            OPA1 = OPAmp(3,5,6);
            o.layout.OPAmps = [OPA1];
            
            Vr1 = VariableResistor(1e6,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LOG,...
                11,0);
            Vr2 = VariableResistor(10e3,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                8,9);
            Vr3 = VariableResistor(10e3,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                9,0);
            o.layout.VarRs = [Vr1 ; Vr2; Vr3];
            
            D1 = Diode(Semiconductor.GERMANIUM,Configuration.MATCHEDPAIR,8,0);

            o.layout.Ds = D1;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel(o.layout);
        end
        
    end
end
