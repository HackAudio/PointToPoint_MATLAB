classdef BigMuffOutput < Circuit 
    
    methods
        function [o] = BigMuffOutput()
            
            o.layout.numNodes = 5;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(3,0);
            voltage = 9; node = 5;
            o.layout.Vs = VoltageSource(voltage,node);
            
            R1 = Resistor(3.3e3,4,0);  % Emitter->Ground
            R2 = Resistor(15e3,3,5);  % Collector->Vs
            R3 = Resistor(100e3,2,0);  % Base->Ground
            R4 = Resistor(430e3,2,5);  % Base->Vs
            o.layout.Rs = [R1; R2; R3 ; R4];
            
            C1 = Capacitor(100e-9,1,2);
            o.layout.Cs = [C1]; % In->Base
            
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