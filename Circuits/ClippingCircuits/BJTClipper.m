classdef BJTClipper < Circuit 
    
    methods
        function [o] = BJTClipper()
            
            o.layout.numNodes = 5;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(3,0);
            o.layout.Vs = VoltageSource(9,5);
            
            R1 = Resistor(50e3,1,2); % In->Base
            R2 = Resistor(1e3,4,0);  % Emitter->Ground
            R3 = Resistor(30e3,3,5);  % Collector->Vs
            o.layout.Rs = [R1; R2; R3];
            
            type = Semiconductor.SILICON; % Semiconductor.GERMANIUM;
            doping = Doping.NPN; 
            
            bjt1 = BJT(doping,type,2,3,4);
            
            % Options for modifying BJT (not necessary to include)
            bjt1.setSaturationCurrent(10e-9);
            bjt1.setEmissionCoeff(1.6);
            
            o.layout.BJTs = bjt1;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end