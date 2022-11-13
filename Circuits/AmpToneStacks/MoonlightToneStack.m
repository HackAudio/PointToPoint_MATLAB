classdef MoonlightToneStack < Circuit 
    
    methods
        function [o] = MoonlightToneStack 
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(5,0);
            
            R1 = Resistor(470e3,1,4);
            R2 = Resistor(220e3,1,2);
            R3 = Resistor(270e3,4,0);
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor(560.0e-12,3,4);
            o.layout.Cs = [C1];
            
            %Tone pot
            Vr1 = VariableResistor(500e3,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,3);
            Vr2 = VariableResistor(500e3,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,0);
            
            %Volume Pot
            Vr3 = VariableResistor(1e6,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4,5);
            Vr4 = VariableResistor(1e6,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5,0);
            
            o.layout.VarRs = [Vr1 ; Vr2; Vr3; Vr4];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end

