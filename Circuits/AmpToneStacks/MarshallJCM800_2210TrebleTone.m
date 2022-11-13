classdef MarshallJCM800_2210TrebleTone < Circuit 
    %Marshall JCM800 2210 Treble Filter Circuit from Normal Channel Tone Stack
    methods
        function [o] =  MarshallJCM800_2210TrebleTone()
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(3,0);
            
            R1 = Resistor(100e3,1,2);
            R2 = Resistor(330e3,2,3);
            R3 = Resistor(500e3,3,0);
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor(10e-9,3,4);
            C2 = Capacitor(2e-9,5,0);
            o.layout.Cs = [C1; C2];
            
            %Treble Pot
            Vr1 = VariableResistor(1e6,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,4);
            Vr1 = VariableResistor(1e6,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,5);
            
            o.layout.VarRs = [Vr1];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end

