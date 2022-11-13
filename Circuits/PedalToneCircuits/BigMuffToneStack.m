classdef BigMuffToneStack < Circuit 
    
    methods
        function [o] = BigMuffToneStack()
            
            o.layout.numNodes = 4;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(3,0);
            
            R1 = Resistor(39e3,1,4);
            R2 = Resistor(25e3,2,0);
            o.layout.Rs = [R1; R2];
            
            C1 = Capacitor(4e-9,1,2);
            C2 = Capacitor(10.0e-9,4,0);
            o.layout.Cs = [C1; C2];
    
            %Tone Pot
            Vr1 = VariableResistor(10e4,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,3);
            Vr2 = VariableResistor(10e4,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,4);
            
            
            o.layout.VarRs = [Vr1 ; Vr2];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end
