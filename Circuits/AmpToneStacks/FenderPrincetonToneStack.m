classdef FenderPrincetonToneStack < Circuit 
    
    methods
        function [o] = FenderPrincetonToneStack 
            
            o.layout.numNodes = 4;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(2,0);
            
            C1 = Capacitor(470.0e-12,2,3);
            C2 = Capacitor(4.7e-9,4,0);
            o.layout.Cs = [C1; C2];
            
            Vr1 = VariableResistor(10e5,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,3);
            Vr2 = VariableResistor(10e5,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,0);
            Vr3 = VariableResistor(1e6,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,1);
            Vr4 = VariableResistor(1e6,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1,4);
            
            o.layout.VarRs = [Vr1 ; Vr2; Vr3; Vr4];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end

