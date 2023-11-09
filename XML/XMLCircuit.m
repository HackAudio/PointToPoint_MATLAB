classdef XMLCircuit < Circuit 

    methods
        function [o] = XMLCircuit(filename)
            o.circuit = openXMLCircuit(filename);

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