classdef MarshallJCM800_2210BassFilter < Circuit 
    
    %Marshall JCM800 2210 Bass Filter Circuit Model
    
    methods
        function [o] =  MarshallJCM800_2210BassFilter()
            
            o.layout.numNodes = 4;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(3,0);
            
            R1 = Resistor(56e3,1,2);
            R2 = Resistor(4.7e3,3,4);
            R3 = Resistor(500e3,3,0);
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor(22e-9,2,3);
            C2 = Capacitor(2e-9,3,0);
            o.layout.Cs = [C1; C2];
            
            %Bass Pot
            Vr1 = VariableResistor(1e6,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4,0);
            
            o.layout.VarRs = [Vr1];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end

