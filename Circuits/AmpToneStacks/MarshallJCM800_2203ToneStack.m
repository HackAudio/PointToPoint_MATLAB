classdef MarshallJCM800_2203ToneStack < Circuit 
    
    %Marshall JCM800 2203,2204 Tone Stack
    methods
        function [o] = MarshallJCM800_2203ToneStack()
            
            o.layout.numNodes = 8;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            
            R1 = Resistor(1.2e3,1,2);
            R2 = Resistor(33e3,2,5);
            R3 = Resistor(500e3,4,0);
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor(470.0e-12,2,3);
            C2 = Capacitor(22e-9,5,6);
            C3 = Capacitor(22e-9,5,8);
            o.layout.Cs = [C1; C2; C3];
            
            %Mid Pot
            Vr1 = VariableResistor(22e3,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                7,8);
            Vr2 = VariableResistor(22e3,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                8,0);
            
            %Bass Pot
            Vr3 = VariableResistor(1e6,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6,7);
            
            %Treble Pot
            Vr4 = VariableResistor(220e3,3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,4);
            Vr5 = VariableResistor(220e3,3,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4,6);
            
            o.layout.VarRs = [Vr1 ; Vr2; Vr3; Vr4; Vr5];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end
