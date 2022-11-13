classdef MarshallJCM900_2210SLXToneStack < Circuit 
    
    methods
        function [o] = MarshallJCM900_2210SLXToneStack()
            
            o.layout.numNodes = 8;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(5,0);
            
            R1 = Resistor(1.2e3,1,2);
            R2 = Resistor(33e3,2,3);
            R3 = Resistor(500e3,5,0);
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor(470.0e-12,2,4);
            C2 = Capacitor(22e-9,3,6);
            C3 = Capacitor(22e-9,3,8);
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
            Vr3 = VariableResistor(220e3,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6,7);
            
            %Treble Pot
            Vr4 = VariableResistor(220e3,3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4,5);
            Vr5 = VariableResistor(220e3,3,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5,6);
            
            o.layout.VarRs = [Vr1 ; Vr2; Vr3; Vr4; Vr5];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end
