classdef BaxandallToneStack < Circuit 
    
    methods
        function [o] = BaxandallToneStack 
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(6,0);
            
            R1 = Resistor(100e3,1,3);
            R2 = Resistor(10e3,5,0);
            R3 = Resistor(180e3,4,6);
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor(330.0e-12,1,2);
            C2 = Capacitor(560.0e-12,3,4);
            C3 = Capacitor(4.7e-9,4,5);
            C4 = Capacitor(3.3e-9,7,0);
            o.layout.Cs = [C1; C2; C3; C4];
            
            %Bass Pot
            Vr1 = VariableResistor(500e3,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,4);
            Vr2 = VariableResistor(500e3,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4,5);
            
            %Treble Pot
            Vr3 = VariableResistor(500e3,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,6);
            Vr4 = VariableResistor(500e3,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6,7);
           
            
            o.layout.VarRs = [Vr1 ; Vr2; Vr3; Vr4];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end

