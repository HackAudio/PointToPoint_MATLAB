classdef VariableResistor < handle
    methods
        function o = VariableResistor(maxValue,parameterNumber,direction,skew,node1,node2)
            o.maxValue = maxValue;
            o.parameterNumber = parameterNumber;
            o.value = maxValue;
            o.normValue = 1;
            
            assert(direction == VariableResistorDirection.PROPORTIONAL || ...
                   direction == VariableResistorDirection.INVPROPORTIONAL,...
                   'Invalid Direction, must be VariableResistorDirection.PROPORTIONAL or VariableResistorDirection.INVPROPORTIONAL');
            o.direction = direction;
            
            assert(skew == VariableResistorSkew.LINEAR || ...
                   skew == VariableResistorSkew.LOG,...
                   'Invalid Skew, must be VariableResistorSkew.LINEAR or VariableResistorSkew.LOG');
            o.skew = skew;
            
            o.node1 = node1;
            o.node2 = node2;
        end
        function [maxValue] = getMaxValue(o)
           maxValue = o.maxValue; 
        end
        function [parameterNumber] = getParameterNumber(o)
           parameterNumber = o.parameterNumber; 
        end
        function setParameterNumber(o,parameterNumber)
           o.parameterNumber = parameterNumber; 
        end
        function setValue(o,normValue)
           setNormValue(o,normValue); 
        end
        function [value] = getValue(o)
            calculateValue(o); 
            value = o.value;
        end
        function [node1] = getNode1(o)
           node1 = o.node1;
        end
        function [node2] = getNode2(o)
           node2 = o.node2;
        end
    end
    
    properties (Access = private)
        maxValue;
        value;
        normValue;
        parameterNumber;
        direction;
        skew;
        node1;
        node2;
    end
    
    methods (Access = private)
        function setNormValue(o,normValue)
            if (normValue < 0)
                o.normValue = 0;
            elseif (normValue > 1)
                o.normValue = 1;
            else
                o.normValue = normValue;
            end
        end
        
        function calculateValue(o)
           tempValue = o.normValue;
           if (o.direction == VariableResistorDirection.INVPROPORTIONAL)
               tempValue = 1.0 - o.normValue;
           end
           if (o.skew == VariableResistorSkew.LOG)
              tempValue = tempValue^10; 
           end
           
           if (tempValue > 0.9999)
               tempValue = 0.9999;
           end
           if (tempValue < 0.0001)
               tempValue = 0.0001;
           end
           
           o.value = tempValue * o.maxValue;
           
        end
    end
        
end
      