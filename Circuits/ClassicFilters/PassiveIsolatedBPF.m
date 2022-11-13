classdef PassiveIsolatedBPF < Circuit 
    %Has a buffer in between HPF and LPF to keep the two filters isolated
    %from each other
   
    methods
        function [o] =  PassiveIsolatedBPF()
            
            o.layout.numNodes = 4;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            
            C1 = Capacitor(2.5e-6,2,0);
            C2 = Capacitor(1e-6,3,4);
            o.layout.Cs = [C1; C2];

           %High pass cut off frequency
            Vr1 = VariableResistor(200,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1,2);

            %Low pass cut off frequency
            Vr2 = VariableResistor(1e3,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4,0);
             o.layout.VarRs = [Vr1 ; Vr2];
             
             
             o.layout.OPAmps = OPAmp(2,3,3);
            

            o.circuit = CircuitModel(o.layout);

        end
    end
end
