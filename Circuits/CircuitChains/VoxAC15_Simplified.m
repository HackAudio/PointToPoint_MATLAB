
%%% NOT WORKING %%%

classdef VoxAC15_Simplified < CircuitChain
    
    methods
        function [o] =  VoxAC15_Simplified()
            
            % This is a "chain" of two different "circuit" types
            chain = {VoxAC15TopBoostInput; VoxAC15ToneStack};  %params = [Volume, bass control, treble control]
            
            o.createChain(chain);
            
        end
    end
end