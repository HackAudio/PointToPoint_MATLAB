classdef SoldanoSuperLeadToneStack < Circuit 
    
    methods
        function [o] = SoldanoSuperLeadToneStack()
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            
            R1 = Resistor(47000,1,2);
            o.layout.Rs = [R1];
            
            C1 = Capacitor(470.0e-12,1,3);
            C2 = Capacitor(22.0e-9,2,5);
            C3 = Capacitor(22.0e-9,2,7);
            o.layout.Cs = [C1; C2; C3];
            
            %Mid pot
            Vr1 = VariableResistor(30e3,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                7,0);
            Vr2 = VariableResistor(30e3,2,...
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
