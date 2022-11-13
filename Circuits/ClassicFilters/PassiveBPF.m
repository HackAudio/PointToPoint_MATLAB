classdef PassiveBPF < Circuit 
   
    methods
        function [o] = PassiveBPF()
            
            o.layout.numNodes = 3;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(3,0);
            
            C1 = Capacitor(2.5e-6,2,0);
            C2 = Capacitor(1e-6,2,3);
            o.layout.Cs = [C1; C2];

           %High cut Frequency Cut Off 
            Vr1 = VariableResistor(200,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1,2);

            %Low cut Frequency Cut Off
            Vr2 = VariableResistor(1e3,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,0);
             o.layout.VarRs = [Vr1 ; Vr2];

            o.circuit = CircuitModel(o.layout);

        end
    end
end
