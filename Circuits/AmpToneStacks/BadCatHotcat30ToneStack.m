classdef BadCatHotcat30ToneStack < Circuit 
    
    methods
        function [o] = BadCatHotcat30ToneStack()
            
            o.layout.numNodes = 6;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(5,0);
            
            R1 = Resistor(1e5,1,2);
            R2 = Resistor(10e3,3,0);
            o.layout.Rs = [R1; R2];
            
            C1 = Capacitor(22.0e-9,2,3);
            C2 = Capacitor(22.0e-9,2,4);
            C3 = Capacitor(50.0e-12,1,6);
            o.layout.Cs = [C1; C2; C3];
            
            Vr1 = VariableResistor(1e6,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,0);
            Vr2 = VariableResistor(1e6,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,4);
            Vr3 = VariableResistor(1e6,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5,4);
            Vr4 = VariableResistor(1e6,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6,5);
            
            
            o.layout.VarRs = [Vr1 ; Vr2; Vr3; Vr4];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end

