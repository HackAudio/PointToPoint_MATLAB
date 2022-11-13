classdef RolandCubeToneStack < Circuit 
    
    methods
        function [o] = RolandCubeToneStack()
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(5,0);
            
            R1 = Resistor(47000,1,2);
            R2 = Resistor(10000,7,0);
            o.layout.Rs = [R1; R2];
            
            C1 = Capacitor(240.0e-12,1,4);
            C2 = Capacitor(0.033e-6,2,6);
            C3 = Capacitor(0.082e-6,2,3);
            C4 = Capacitor(0.01e-6,3,0);
            o.layout.Cs = [C1; C2; C3];
            
            Vr1 = VariableResistor(10e3,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,0);
            Vr2 = VariableResistor(25e4,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6,7);
            Vr3 = VariableResistor(25e4,3,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5,6);
            Vr4 = VariableResistor(25e4,3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4,5);
            
            o.layout.VarRs = [Vr1 ; Vr2; Vr3; Vr4];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end

