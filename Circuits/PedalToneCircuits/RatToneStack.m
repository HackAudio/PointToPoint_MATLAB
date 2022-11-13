classdef RatToneStack < Circuit 
    
    methods
        function [o] = RatToneStack()
            
            o.layout.numNodes = 3;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(3,0);
            
            R1 = Resistor(1500,2,3);
            o.layout.Rs = [R1];
            
            C1 = Capacitor(3.3e-9,3,0);
            o.layout.Cs = [C1];
            
            Vr1 = VariableResistor(10e4,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1,2);
            
            o.layout.VarRs = [Vr1];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end
