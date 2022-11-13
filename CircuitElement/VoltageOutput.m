classdef VoltageOutput
    
    methods
        function o = VoltageOutput(node1,node2)
            o.node1 = node1;
            o.node2 = node2;
        end
        function [node1] = getNode1(o)
           node1 = o.node1; 
        end
        function [node2] = getNode2(o)
           node2 = o.node2;
        end
    end
    
    properties (Access = private)
        node1;
        node2;
    end
        
end
            