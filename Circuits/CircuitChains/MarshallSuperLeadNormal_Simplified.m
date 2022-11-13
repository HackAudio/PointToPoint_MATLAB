classdef MarshallSuperLeadNormal_Simplified < CircuitChain
    
    methods
        function [o] =  MarshallSuperLeadNormal_Simplified()
            
            % This is a "chain" of two different "circuit" types
            chain = {MarshallSuperLeadNormalInput; MarshallSuperLeadToneStack_NoPot};  %params = [Volume]
            
            o.createChain(chain);
            
        end
    end
end