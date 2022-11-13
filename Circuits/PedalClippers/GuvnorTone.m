 classdef GuvnorTone < Circuit 
    
    methods
        function [o] = GuvnorTone()
            
            o.layout.numNodes = 9;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(9,0);
            
            R1 = Resistor(1.5e3,1,2);
            R2 = Resistor(680,3,0); 
            R3 = Resistor(680,2,4);
            R4 = Resistor(100,6,7);
            o.layout.Rs = [R1; R2; R3; R4];
            
            C1 = Capacitor(4.7e-9,1,8);
            C2 = Capacitor(100e-9,2,3);
            C3 = Capacitor(220e-9,2,5);
            C4 = Capacitor(10e-9,7,8);
            C5 = Capacitor(68e-9,4,0);
            o.layout.Cs = [C1; C2; C3; C4; C5];
            
            %Bass Control
            Vr1 = VariableResistor(10e3,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR ,...
                3,4);
            
            Vr2 = VariableResistor(10e3,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,0);
            
            
            %Mid Control
            Vr3 = VariableResistor(10e3,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR ,...
                5,6);
            
            Vr4 = VariableResistor(10e3,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5,0);
            
            %Treble Control
            Vr5 = VariableResistor(10e3,3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR ,...
                8,9);
            
            Vr6 = VariableResistor(10e3,3,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                9,4);
            
            o.layout.VarRs = [Vr1; Vr2; Vr3; Vr4; Vr5; Vr6];
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end
 
