classdef GuvnorOutput < Circuit 
    
    methods
        function [o] = GuvnorOutput()
            
            o.layout.numNodes = 3;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(3,0);
            
            R1 = Resistor(22e3,2,3);
            o.layout.Rs = [R1];
            
            C1 = Capacitor(470e-12,3,0);
            o.layout.Cs = [C1];
            
            %Output Control
            Vr1 = VariableResistor(100e3,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR ,...
                1,2);
            
            Vr2 = VariableResistor(100e3,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,0);
            
             o.layout.VarRs = [Vr1; Vr2];
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end