classdef RatOutput < Circuit 
    
    %not working
    
    methods
        function [o] = RatOutput()
            
            o.layout.numNodes = 5;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(5,0);
            o.layout.Vs = VoltageSource(9,3);
            
            R1 = Resistor(1e5,2,0);
            R2 = Resistor(10e3,4,0); 
            R3 = Resistor(100e3,5,0);
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor(22e-9,1,2);
            C2 = Capacitor(1e-6,4,5);
            o.layout.Cs = [C1; C2];
            
            type = Semiconductor.SILICON; % Semiconductor.GERMANIUM;
            doping = Doping.NPN; 
            
            bjt1 = BJT(doping,type,2,3,4);
            
            % Options for modifying BJT (not necessary to include)
            bjt1.setSaturationCurrent(10e-9);
            bjt1.setEmissionCoeff(1.6);
            o.layout.BJTs = bjt1;
  
           %{
            Vr1 = VariableResistor(100e3,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR ,...
                5,6);
            Vr2 = VariableResistor(100e3,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6,0); 
            %}
            
            
           %o.layout.VarRs = [Vr1; Vr2];
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end
