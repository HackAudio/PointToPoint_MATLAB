classdef LPF2x < CircuitChain
    
    methods
        function [o] = LPF2x()
            
            chain = {Active2ndOrderLPF,Active2ndOrderLPF};
            
            o.createChain(chain);
            
            % This is a "chain" of two circuits that each
            % have a variable resistor. It is meant to be an
            % example of how to pass in parameters to a circuit chain.
            % The array of parameters passed into the circuit chain
            % get "sliced" off as they are used for the individual
            % circuits, in order. 
            % As a general example, supposed a circuit chain
            % is made up of 3 circuits. The first has 2 parameters, the
            % second has 3 parameters, and the third has 1 parameter. A
            % parameter array of size 6 (2+3+1) should be used. As the
            % parameter array is passed into each circuit, the approach
            % number are sliced off at the beginning and used. The first
            % circuit uses the first two parameters, such that the new
            % array of parameters only has the last 4 parameters remaining,
            % etc. This also holds true when circuit chains are made up of
            % small circuit chains. Each circuit chain uses up the
            % parameters it needs and then passes the remaining parameters
            % in the array to the next circuit chain.
            %
            % In "LPF2x", each LPF has a single "UI" parameter
            % to control the variable resistors. Therefore, an array
            % of parameters with length/size = 2 should be used
            % when calling the function "setParameters" for this chain
            % The first parameter is used in the first LPF and the 
            % second parameter is used in the second LPF
            
            
        end
        
    end
end