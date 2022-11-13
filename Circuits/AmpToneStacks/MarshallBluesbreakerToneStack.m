classdef MarshallBluesbreakerToneStack < Circuit 
    
    methods
        function [o] =  MarshallBluesbreakerToneStack()
            
            o.layout.numNodes = 8;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            
            R1 = Resistor(1200,1,2);
            R2 = Resistor(56000,2,8);
            o.layout.Rs = [R1; R2];
            
            C1 = Capacitor(220.0e-12,2,3);
            C2 = Capacitor(22.0e-9,8,5);
            C3 = Capacitor(22.0e-9,8,7);
            o.layout.Cs = [C1; C2; C3];
            
            %Mid Pot
            Vr1 = VariableResistor(22e3,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                7,0);
            Vr2 = VariableResistor(22e3,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6,7);
            
            
            %Bass Pot
            Vr3 = VariableResistor(1e6,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5,6);
            
            
            %Treble Pot
            Vr4 = VariableResistor(22e4,3,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4,5);
            Vr5 = VariableResistor(22e4,3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,4);
            
            o.layout.VarRs = [Vr1 ; Vr2; Vr3; Vr4; Vr5];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end
