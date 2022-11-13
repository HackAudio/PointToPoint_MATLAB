classdef MXRclipping < Circuit 
    
    methods
        function [o] =  MXRclipping()
            
            o.layout.numNodes = 4;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            
            
            R1 = Resistor(10e3,2,3);
            o.layout.Rs = [R1];
            
            C1 = Capacitor(1e-6,1,2);
            o.layout.Cs = [C1];

            Vr1 = VariableResistor(10e3,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,4);
            Vr2 = VariableResistor(10e3,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4,0);

            o.layout.VarRs = [Vr1 ; Vr2];
            
            D1 = Diode(Semiconductor.GERMANIUM,Configuration.MATCHEDPAIR,3,0);

            o.layout.Ds = D1;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel(o.layout);
        end
        
    end
end
