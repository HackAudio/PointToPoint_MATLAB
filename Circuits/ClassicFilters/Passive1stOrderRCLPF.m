classdef Passive1stOrderRCLPF < Circuit 
    
    methods
        function [o] = Passive1stOrderRCLPF()
            
            o.layout.numNodes = 3;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(3,0);
            R = Resistor(100,1,2); 
            o.layout.Rs = R;
            
            C = Capacitor(47e-9,3,0);
            o.layout.Cs = C;
            
            %Cut Off Frequency
            Vr1 = VariableResistor(69900,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,3);
            o.layout.VarRs = [Vr1];

            o.circuit = CircuitModel(o.layout);
        end
        
    end
end