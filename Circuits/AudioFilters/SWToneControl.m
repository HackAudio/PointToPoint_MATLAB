classdef SWToneControl < Circuit 
    
    methods
        function [o] =  SWToneControl 
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(5,0);
            
            R1 = Resistor(10e3,1,2);
            R2 = Resistor(47e3,2,4);
            o.layout.Rs = [R1; R2];
            
            C1 = Capacitor(0.022e-6,2,3);
            o.layout.Cs = [C1];

            
            %tone pot
            Vr1 = VariableResistor(100000,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4,3);
            Vr2 = VariableResistor(100000,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,0);
            
            %gain
            Vr3 = VariableResistor(100000,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4,5);
            Vr4 = VariableResistor(100000,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5,0);
           
            
            o.layout.VarRs = [Vr1 ; Vr2; Vr3; Vr4];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end

