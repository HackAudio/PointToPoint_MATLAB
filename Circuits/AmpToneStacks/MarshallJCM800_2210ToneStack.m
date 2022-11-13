classdef MarshallJCM800_2210ToneStack < Circuit 
    
    %Marshall JCM800 2210 Normal Channel Tone Stack
    methods
        function [o] = MarshallJCM800_2210ToneStack
            
            o.layout.numNodes = 9;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(8,0);
            
            R1 = Resistor(1.2e3,1,2);
            R2 = Resistor(100e3,3,6);
            R3 = Resistor(100e3,5,0);
            R4 = Resistor(330e3,6,8);
            R5 = Resistor(50e3,8,0);
            o.layout.Rs = [R1; R2; R3; R4; R5];
            
            C1 = Capacitor(22.0e-9,2,4);
            C2 = Capacitor(5.0e-9,2,3);
            C3 = Capacitor(10.0e-9,8,9);
            C4 = Capacitor(2e-9,7,0);
            o.layout.Cs = [C1; C2; C3; C4];
            
            %Bass Pot
            Vr1 = VariableResistor(1e6,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,4);
            Vr2 = VariableResistor(1e6,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,5);
            
            %Treble Pot
            Vr3 = VariableResistor(1e6,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6,9);
            Vr4 = VariableResistor(1e6,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6,7);
            
            o.layout.VarRs = [Vr1 ; Vr2; Vr3; Vr4];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end
