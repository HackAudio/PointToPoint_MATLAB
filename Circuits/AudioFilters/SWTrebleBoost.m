classdef SWTrebleBoost < Circuit 
    
    methods
        function [o] = SWTrebleBoost 
            
            o.layout.numNodes = 4;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            
            C1 = Capacitor(0.022e-6,2,3);
            o.layout.Cs = [C1];

            
            %treble boost pot
            Vr1 = VariableResistor(10e4,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1,2);
            Vr2 = VariableResistor(10e4,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,3);
            
            %gain pot
            Vr3 = VariableResistor(10e4,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,4);
            Vr4 = VariableResistor(10e4,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4,0);
           
            
            o.layout.VarRs = [Vr1 ; Vr2; Vr3; Vr4];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end

