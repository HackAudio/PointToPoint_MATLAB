classdef OPAmp
    
    methods
        function o = OPAmp(nonInvertingNode,invertingNode,...
                outputNode)
            o.nonInvertingNode = nonInvertingNode;
            o.invertingNode = invertingNode;
            o.outputNode = outputNode;
        end
        function [nonInvertingNode] = getNonInvertingNode(o)
           nonInvertingNode = o.nonInvertingNode; 
        end
        function [invertingNode] = getInvertingNode(o)
           invertingNode = o.invertingNode;
        end
        function [outputNode] = getOutputNode(o)
           outputNode = o.outputNode;
        end
    end
    
    properties (Access = private)
        nonInvertingNode;
        invertingNode;
        outputNode;
    end
        
end
            