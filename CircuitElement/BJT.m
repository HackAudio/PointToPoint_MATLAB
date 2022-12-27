classdef BJT
    
    methods
        function o = BJT(doping,type,nodeBase,nodeCollector,nodeEmitter)
            assert(type == Semiconductor.SILICON || ...
                   type == Semiconductor.GERMANIUM,...
                   'Invalid BJT Semiconductor Type, must be Semiconductor.SILICON or Semiconductor.GERMANIUM');
            o.type = type;
            
            assert(doping == Doping.NPN || ...
                   doping == Doping.PNP,...
                   'Invalid BJT Doping Type, must be Doping.NPN or Doping.PNP');
            o.doping = doping;
            
            o.nodeBase = nodeBase;
            o.nodeCollector = nodeCollector;
            o.nodeEmitter = nodeEmitter;
            
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
        function [doping] = getDoping(o)
           doping = o.doping; 
        end
        function [nodeBase] = getNodeBase(o)
           nodeBase = o.nodeBase; 
        end
        function [nodeCollector] = getNodeCollector(o)
           nodeCollector = o.nodeCollector; 
        end
        function [nodeEmitter] = getNodeEmitter(o)
           nodeEmitter = o.nodeEmitter; 
        end
    end
    
    properties (Access = private)
        type;
        doping;
        nodeBase;
        nodeCollector;
        nodeEmitter;
        Is;
        eta;
        Vt = 26.0e-3;
    end
        
end
            