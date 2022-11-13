classdef VoltageSource
    
    methods
        function o = VoltageSource(voltage,node)
            o.voltage = voltage;
            o.node = node;
        end
        function [voltage] = getVoltage(o)
           voltage = o.voltage; 
        end
        function [node] = getNode(o)
           node = o.node;
        end
    end
    
    properties (Access = private)
        voltage;
        node;
    end
        
end
            