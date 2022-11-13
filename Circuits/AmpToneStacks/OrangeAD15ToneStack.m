classdef OrangeAD15ToneStack < Circuit 
    
    methods
        function [o] = OrangeAD15ToneStack 
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            
            R1 = Resistor(68e3,1,2);
            o.layout.Rs = [R1];
            
            C1 = Capacitor(150.0e-12,1,3);
            C2 = Capacitor(0.022e-6,2,5);
            C3 = Capacitor(0.022e-6,2,7);
            o.layout.Cs = [C1; C2; C3];
            
            %Mid Pot
            Vr1 = VariableResistor(25e3,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                7,0);
            Vr2 = VariableResistor(25e3,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6,7);
            
            %Bass Pot
            Vr3 = VariableResistor(25e4,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5,6);
            
            
            %Treble Pot
            Vr4 = VariableResistor(25e4,3,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4,5);
             Vr5 = VariableResistor(25e4,3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,4);
           
           
            
            o.layout.VarRs = [Vr1 ; Vr2; Vr3; Vr4; Vr5];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end
