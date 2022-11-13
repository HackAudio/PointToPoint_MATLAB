classdef UnityGainBassBoost < Circuit 
    
    methods
        function [o] = UnityGainBassBoost 
            
            o.layout.numNodes = 4;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            
            R1 = Resistor(10e3,1,2);
            R2 = Resistor(10e2,3,0);
            o.layout.Rs = [R1; R2];
            
            C1 = Capacitor(110.0e-9,3,4);
            o.layout.Cs = [C1];
            
            o.layout.OPAmps = OPAmp(2,3,4);
            
            Vr1 = VariableResistor(9100,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,4);
            
       
            
            o.layout.VarRs = [Vr1];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end