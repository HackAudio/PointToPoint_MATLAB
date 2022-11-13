classdef Diode < handle
    
    methods
        function o = Diode(type,config,node1,node2)
            
            assert(type == Semiconductor.SILICON || ...
                   type == Semiconductor.GERMANIUM, ...
                   'Invalid Diode Semiconductor Type, must be Semiconductor.SILICON or Semiconductor.GERMANIUM');
            o.type = type;
            
            assert(config == Configuration.SINGLE || ...
                   config == Configuration.MATCHEDPAIR, ...
                   'Invalid Diode Configuration, must be Configuration.SINGLE or Configuration.MATCHEDPAIR');
            o.config = config;
            
            o.node1 = node1;
            o.node2 = node2;
            
            if (type == Semiconductor.SILICON)
                o.Is = 1.0e-12;
                o.eta = 1.0;
            else
                o.Is = 1.0e-6;
                o.eta = 1.68;
            end
        end
        function [Is] = getSaturationCurrent(o)
           Is = o.Is; 
        end
        function [o] = setSaturationCurrent(o,Is)
           o.Is = Is;
        end
        function [Vt] = getThermalVoltage(o)
           Vt = o.Vt; 
        end
        function [o] = setThermalVoltage(o,Vt)
           o.Vt = Vt;
        end
        function [eta] = getEmissionCoeff(o)
           eta = o.eta; 
        end
        function [o] = setEmissionCoeff(o,eta)
           o.eta = eta;
        end
        function [config] = getConfiguration(o)
           config = o.config; 
        end
        function [node1] = getNode1(o)
           node1 = o.node1; 
        end
        function [node2] = getNode2(o)
           node2 = o.node2; 
        end
    end
    
    properties (Access = private)
        type;
        config;
        node1;
        node2;
        Is;
        eta;
        Vt = 26.0e-3;
    end
        
end
            