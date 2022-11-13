classdef GuvnorInput < Circuit 
    
    methods
        function [o] = GuvnorInput()
            
            o.layout.numNodes = 7;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(6,0);
            voltage = 4.5; node = 7;
            Vs1 = VoltageSource(voltage,node);
            o.layout.Vs = [Vs1];
            
            R1 = Resistor(2.2e6,1,0);
            R2 = Resistor(1e6,2,7); 
            R3 = Resistor(2.2e3,3,5);
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor(9.6e-9,1,2);
            C2 = Capacitor(120e-12,3,4);
            C3 = Capacitor(100e-9,5,0);
            o.layout.Cs = [C1; C2; C3];
            
            OPA1 = OPAmp(2,3,4);
            o.layout.OPAmps = [OPA1];
            
            Vr1 = VariableResistor(100e3,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR ,...
                3,4);
            
            Vr2 = VariableResistor(100e3,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4,6);
            
            o.layout.VarRs = [Vr1; Vr2];
            
            o.layout.hasDCBlocker = true;
            
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end
 


