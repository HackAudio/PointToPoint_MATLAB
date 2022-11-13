classdef CircuitChain < CircuitProcessor
    % Generic base class for all circuits
    
    properties
        circuitChain;
    end
    
    methods (Access = protected)
        function [o] = createChain(o,ArrayCircuits)
            ArrayCircuits = ArrayCircuits(:);
            for m = 1:length(ArrayCircuits)
                assert(isa(ArrayCircuits{m,1},'CircuitProcessor'),'Input to "CircuitChain" must be an array of "CircuitProcessor"');
            end
            o.circuitChain = ArrayCircuits;
        end
    end
    
    methods
   
        function [output] = process(o,input,numSamples,numChannels)
            output = input;
            for m = 1:length(o.circuitChain)
                output = o.circuitChain{m,1}.process(output,numSamples,numChannels);
            end
        end
        
        function [buffer] = processInPlace(o,buffer,numSamples,numChannels)
            for m = 1:length(o.circuitChain)
                buffer = o.circuitChain{m,1}.processInPlace(buffer,numSamples,numChannels);
            end
        end
        
        function [y] = processSample(o,x,channel)
            for m = 1:length(o.circuitChain)
                y = o.circuitChain{m,1}.processSample(x,channel);
            end
        end
        
        function prepare(o,sampleRate,bufferSize)
            for m = 1:length(o.circuitChain)
                o.circuitChain{m,1}.prepare(sampleRate,bufferSize);
            end
        end
        
        function setSamples4Smooth(o,samples4Smooth)
            for m = 1:length(o.circuitChain)
                o.circuitChain{m,1}.setSamples4Smooth(samples4Smooth);
            end
        end
        
        function [remainingParameters] = setParameters(o,parameters)
            remainingParameters = parameters;
            for m = 1:length(o.circuitChain)
                remainingParameters = o.circuitChain{m,1}.setParameters(remainingParameters);
            end
        end
    end
end