classdef FenderBlondeTwinToneStack < Circuit 
    
    methods
        function [o] = FenderBlondeTwinToneStack
            
            o.layout.numNodes = 6;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            
            R1 = Resistor(100e3,1,3);
            R2 = Resistor(10e3,5,0);
            o.layout.Rs = [R1; R2];
            
            C1 = Capacitor(0.00025e-6,1,2);
            C2 = Capacitor(0.001e-6,3,4);
            C3 = Capacitor(0.001e-6,4,5);
            C4 = Capacitor(0.05e-6,6,0);
            o.layout.Cs = [C1; C2; C3; C4];
            
            %Bass Pot
            Vr1 = VariableResistor(1e6,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,4);
            Vr2 = VariableResistor(1e6,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4,5);
            
            %Treble Pot
            Vr3 = VariableResistor(350e3,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,4);
            Vr4 = VariableResistor(350e3,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4,6);
            
            o.layout.VarRs = [Vr1 ; Vr2; Vr3; Vr4];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end
