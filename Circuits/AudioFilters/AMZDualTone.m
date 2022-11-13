classdef AMZDualTone < Circuit 
    
    methods
        function [o] =  AMZDualTone 
            
            o.layout.numNodes = 4;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(3,0);
            
            R1 = Resistor(39e3,1,2);
            R2 = Resistor(22e3,4,0);
            o.layout.Rs = [R1; R2];
            
            C1 = Capacitor(0.01e-6,2,0);
            C2 = Capacitor(3900.0e-12,1,4);
            o.layout.Cs = [C1;C2];

            
            %tone pot
            Vr1 = VariableResistor(100000,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,3);
            Vr2 = VariableResistor(100000,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,4);
            
           
            
            o.layout.VarRs = [Vr1 ; Vr2];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end


