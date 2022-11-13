classdef HiWattCP103ToneStack < Circuit 
    
    methods
        function [o] = HiWattCP103ToneStack 
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(5,0);
            
            R1 = Resistor(100e3,1,3);
            R2 = Resistor(10e3,3,4);
            o.layout.Rs = [R1; R2];
            
            C1 = Capacitor(0.047e-6,4,0);
            C2 = Capacitor(220.0e-12,1,2);
            o.layout.Cs = [C1; C2];
            
            %Treble Pot
            Vr1 = VariableResistor(250e3,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,5);
            Vr2 = VariableResistor(250e3,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,5);
            
            %Bass Pot
            Vr3 = VariableResistor(1e6,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,4);
            Vr4 = VariableResistor(1e6,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4,0);
            
            o.layout.VarRs = [Vr1 ; Vr2; Vr3; Vr4];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end
