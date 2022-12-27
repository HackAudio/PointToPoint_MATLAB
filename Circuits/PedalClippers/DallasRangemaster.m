classdef DallasRangemaster < Circuit 
   
    methods
        function [o] =  DallasRangemaster()
            
            o.layout.numNodes = 5;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(5,0);
            o.layout.Vs = VoltageSource(9,4); % Voltage, Node
            
            R1 = Resistor(68e3,4,2); % Vs to base
            R2 = Resistor(470e3,2,0); % base to ground
            R3 = Resistor(3.9e3,4,3); % Vs to emitter
            R4 = Resistor(10e3,5,0); % Collector to ground
            o.layout.Rs = [R1;R2; R3; R4];
             
            C1 = Capacitor(5e-9,1,2); % in to base
            C2 = Capacitor(47e-6,4,3); % Vs to emitter
            %o.layout.Cs = [C2]; 
            o.layout.Cs = [C1; C2]; 
            
            type = Semiconductor.GERMANIUM;
            doping = Doping.PNP;
            bjt = BJT(doping,type,2,5,3); % base, collector, emitter
            
            o.layout.BJTs = bjt;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end