classdef XMLCircuitChain < CircuitChain
    
    methods
        function [o] = XMLCircuitChain(filename)
            
            chain = openXMLCircuit(filename);
            
            o.createChain(chain);

            [~,o.name] = fileparts(filename);
        end
        function [name] = getName(o)
           name = o.name;
        end
    end

    properties (Access = private)
        name;
    end
end