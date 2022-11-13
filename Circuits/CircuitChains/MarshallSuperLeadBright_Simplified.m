classdef MarshallSuperLeadBright_Simplified < CircuitChain
    
    methods
        function [o] =  MarshallSuperLeadBright_Simplified()
            
            % This is a "chain" of two different "circuit" types
            chain = {MarshallSuperLeadBrightInput; MarshallSuperLeadToneStack_NoPot};  %params = [Volume]
            
            o.createChain(chain);
            
        end
    end
end