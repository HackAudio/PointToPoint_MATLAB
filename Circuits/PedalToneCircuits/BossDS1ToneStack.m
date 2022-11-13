classdef BossDS1ToneStack < Circuit 
    
    methods
        function [o] = BossDS1ToneStack()
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(7,0);
            
            R1 = Resistor(6.8e3,1,2);
            R2 = Resistor(2.2e3,3,4);
            R3 = Resistor(10e3,6,7);
            R4 = Resistor(6.8e8,4,0);
            o.layout.Rs = [R1; R2; R3; R4];
            
            C1 = Capacitor(0.022e-6,1,3);
            C2 = Capacitor(0.1e-6,2,0);
            o.layout.Cs = [C1; C2];
            
            Vr1 = VariableResistor(20e3,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,5);
            Vr2 = VariableResistor(20e3,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5,4);
            Vr3 = VariableResistor(100e3,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5,6);
            Vr4 = VariableResistor(100e3,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6,0);
            
            o.layout.VarRs = [Vr1 ; Vr2; Vr3; Vr4];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end


