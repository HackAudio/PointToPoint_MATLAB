classdef VoxACToneStack < Circuit 
    
    methods
        function [o] = VoxACToneStack 
            
            o.layout.numNodes = 6;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            
            R1 = Resistor(10e4,1,2);
            R2 = Resistor(10e3,6,0);
            o.layout.Rs = [R1; R2];
            
            C1 = Capacitor(47.0e-12,1,3);
            C2 = Capacitor(22.0e-9,2,5);
            C3 = Capacitor(22.0e-9,2,6);
            o.layout.Cs = [C1; C2; C3];
            
            %Bass Pot
            Vr1 = VariableResistor(10e5,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6,0);
            Vr2 = VariableResistor(10e5,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5,6);
            
            %Treble Pot
            Vr3 = VariableResistor(10e5,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4,5);
            Vr4 = VariableResistor(10e5,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,4);
           
            
            o.layout.VarRs = [Vr1 ; Vr2; Vr3; Vr4];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end
