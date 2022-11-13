classdef MesaBoogieBottleRocketToneStack < Circuit 
    
    methods
        function [o] = MesaBoogieBottleRocketToneStack()
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(3,0);
            
            R1 = Resistor(33000,1,7);
            R2 = Resistor(10000,6,5);
            R3 = Resistor(10000,5,0);
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor(500.0e-12,1,2);
            C2 = Capacitor(0.022e-6,7,4);
            C3 = Capacitor(0.022e-6,7,6);
            o.layout.Cs = [C1; C2; C3];
            
            %Bass Pot
            Vr1 = VariableResistor(10e5,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4,5);
            
            %Treble Pot
             Vr2 = VariableResistor(20e4,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,3);
            
             Vr3 = VariableResistor(20e4,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,4);
            
            o.layout.VarRs = [Vr1; Vr2; Vr3];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end
