classdef AmpegB15PortaflexToneStack < Circuit 
    
    methods
        function [o] = AmpegB15PortaflexToneStack 
            
            o.layout.numNodes = 9;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(9,0);
            
            R1 = Resistor(220e3,2,3);
            R2 = Resistor(120e3,4,6);
            R3 = Resistor(22e3,5,0);
            R4 = Resistor(270e3,4,0);
            R5 = Resistor(270e3,6,9);
            o.layout.Rs = [R1; R2; R3; R4; R5];
            
            C1 = Capacitor(0.1e-6,1,2);
            C2 = Capacitor(0.001e-6,3,4);
            C3 = Capacitor(0.01e-6,4,5);
            C4 = Capacitor(0.00047e-6,2,7);
            C5 = Capacitor(0.0047e-6,8,0);
            o.layout.Cs = [C1; C2; C3; C4; C5];
            
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
            Vr3 = VariableResistor(1e6,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6,7);
            Vr4 = VariableResistor(1e6,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6,8);
            
            o.layout.VarRs = [Vr1 ; Vr2; Vr3; Vr4];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end
