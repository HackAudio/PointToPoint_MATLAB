classdef TubeScreamerToneStack < Circuit 
    
    methods
        function [o] = TubeScreamerToneStack()
            
            o.layout.numNodes = 9;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(9,0);
            
            R1 = Resistor(1000,1,2);
            R2 = Resistor(10000,2,0);
            R3 = Resistor(220,3,0);
            R4 = Resistor(1000,5,6);
            R5 = Resistor(1000,7,8);
            o.layout.Rs = [R1; R2; R3; R4; R5];
            
            C1 = Capacitor(0.22e-6,2,0);
            C2 = Capacitor(0.22e-6,3,4);
            C3 = Capacitor(1.0e-6,6,7);
            o.layout.Cs = [C1; C2; C3];
            
            o.layout.OPAmps = OPAmp(2,5,6);
            
            Vr1 = VariableResistor(20e3,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,4);
            Vr2 = VariableResistor(20e3,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4,5);
            Vr3 = VariableResistor(100e3,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                8,9);
            Vr4 = VariableResistor(100e3,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                9,0);
            
            o.layout.VarRs = [Vr1 ; Vr2; Vr3; Vr4];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end
