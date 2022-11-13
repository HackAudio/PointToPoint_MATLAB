classdef MarshallJCM800_2210TrebleFilter < Circuit 
    
    %Marshall JCM800 2210 Treble Filter Circuit Model
    
    methods
        function [o] =  MarshallJCM800_2210TrebleFilter()
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(3,0);
            
            R1 = Resistor(4.7e3,4,5);
            o.layout.Rs = [R1];
            
            C1 = Capacitor(470e-12,1,2);
            C2 = Capacitor(2e-9,4,0);
            o.layout.Cs = [C1; C2];
            
            %Bass Pot
            Vr1 = VariableResistor(1e6,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5,0);
            
            
             %Treble Pot
            Vr2 = VariableResistor(220e3,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,3);
  
            Vr3 = VariableResistor(220e3,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,4);
            
            o.layout.VarRs = [Vr1; Vr2; Vr3];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end

