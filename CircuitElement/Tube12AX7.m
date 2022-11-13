classdef Tube12AX7 < handle
    
    methods
        function o = Tube12AX7(model,nodeGrid,nodeAnode,nodeCathode)
            assert(model == Model12AX7.RSD1 || ...
                   model == Model12AX7.RSD2 || ...
                   model == Model12AX7.EXH ,...
                   'Invalid 12AX7 Tube Model, must be Model12AX7.RSD1 or Model12AX7.RSD2 or Model12AX7.EXH');
            o.model = model;
            
            o.nodeGrid = nodeGrid;
            o.nodeAnode = nodeAnode;
            o.nodeCathode = nodeCathode;
     
        end
        function [nodeGrid] = getNodeGrid(o)
           nodeGrid = o.nodeGrid; 
        end
        function [nodeAnode] = getNodeAnode(o)
           nodeAnode = o.nodeAnode; 
        end
        function [nodeCathode] = getNodeCathode(o)
           nodeCathode = o.nodeCathode; 
        end
        function [model] = getModel(o)
           model = o.model; 
        end
    end
    
    properties (Access = private)
        model;
        nodeGrid;
        nodeAnode;
        nodeCathode;
        G;
        mu;
        ga;
        C;
        Gg;
        ep;
        Cg;
        Io;
    end
        
end
            