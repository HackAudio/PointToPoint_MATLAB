classdef Potentiometer < handle
    methods
        function o = Potentiometer(maxValue,parameterNumber,direction,skew,node1,node2,node3,varargin) 
            % varargin - optional input variable for a text label (string)

            o.maxValue = maxValue;
            o.parameterNumber = parameterNumber;
            o.value = maxValue;
            
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
            o.node3 = node3;

            if (direction == VariableResistorDirection.PROPORTIONAL)
                o.Vr1 = VariableResistor(maxValue,parameterNumber,VariableResistorDirection.PROPORTIONAL,skew,node1,node2,varargin{:});
                o.Vr2 = VariableResistor(maxValue,parameterNumber,VariableResistorDirection.INVPROPORTIONAL,skew,node2,node3,varargin{:});
            else
                o.Vr1 = VariableResistor(maxValue,parameterNumber,VariableResistorDirection.INVPROPORTIONAL,skew,node1,node2,varargin{:});
                o.Vr2 = VariableResistor(maxValue,parameterNumber,VariableResistorDirection.PROPORTIONAL,skew,node2,node3,varargin{:});
            end

            if (~isempty(varargin))
                if (isstring(varargin{1,1}) || ischar(varargin{1,1}))
                    o.label = varargin{1,1};
                end

                if (length(varargin) == 2)
                    if (isstring(varargin{1,2}) || ischar(varargin{1,2}))
                        o.label = varargin{1,2};
                    end
                end
            end
        end

        function [Vr1] = getVariableResistor1(o)
           Vr1 = o.Vr1;
        end
        function [Vr2] = getVariableResistor2(o)
           Vr2 = o.Vr2;
        end
        function [maxValue] = getMaxValue(o)
           maxValue = o.maxValue; 
        end
        function [parameterNumber] = getParameterNumber(o)
           parameterNumber = o.parameterNumber; 
        end
        function setParameterNumber(o,parameterNumber)
           o.parameterNumber = parameterNumber; 
           o.Vr1.setParameterNumber(parameterNumber);
           o.Vr2.setParameterNumber(parameterNumber);
        end
        function setValue(o,value)
           o.value = value;
           o.Vr1.setValue(value);
           o.Vr2.setValue(value);
        end
        function [value] = getNormValue(o)
            value = o.value;
        end
        function [node1] = getNode1(o)
           node1 = o.node1;
        end
        function [node2] = getNode2(o)
           node2 = o.node2;
        end
        function [node3] = getNode3(o)
           node3 = o.node3;
        end
        function [direction] = getDirection(o)
           direction = o.direction;
        end
        function [skew] = getSkew(o)
           skew = o.skew;
        end
        function [label] = getLabel(o)
            label = o.label;
        end
    end
    
    properties (Access = private)
        maxValue;
        value;
        parameterNumber;
        direction;
        skew;
        node1;
        node2;
        node3;
        label = '';

        Vr1;
        Vr2;
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
    end
        
end
      