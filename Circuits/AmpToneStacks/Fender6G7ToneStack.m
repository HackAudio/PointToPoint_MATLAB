classdef Fender6G7ToneStack < Circuit 
    
    methods
        function [o] = Fender6G7ToneStack 
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(3,0);
            
            R1 = Resistor(100e3,1,4);
            R2 = Resistor(10e3,5,0);
            o.layout.Rs = [R1; R2];
            
            C1 = Capacitor(250.0e-12,1,2);
            C2 = Capacitor(0.01e-6,4,5);
            o.layout.Cs = [C1; C2];
            
            %Treble Pot
            Vr1 = VariableResistor(250e3,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,3);
            Vr2 = VariableResistor(250e3,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,4);
            
            %Bass Pot
            Vr3 = VariableResistor(250e3,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4,5);
            Vr4 = VariableResistor(250e3,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5,0);
            
            o.layout.VarRs = [Vr1 ; Vr2; Vr3; Vr4];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end