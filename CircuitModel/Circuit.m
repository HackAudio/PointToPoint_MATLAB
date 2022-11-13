classdef Circuit < CircuitProcessor
    % Generic base class for all Circuits
    
    properties
        layout;
        circuit;
    end
    
    methods
        function [o] = Circuit()
            o.layout = CircuitLayout;
        end
        
        function [output] = process(o,input,numSamples,numChannels)
            output = o.circuit.process(input,numSamples,numChannels);
        end
        
        function [buffer] = processInPlace(o,buffer,numSamples,numChannels)
            buffer = o.circuit.processInPlace(buffer,numSamples,numChannels);
        end
        
        function [y] = processSample(o,x,channel)
            y = o.circuit.processSample(x,channel);
        end
        
        function prepare(o,sampleRate,bufferSize)
            o.circuit.prepare(sampleRate,bufferSize);
        end
        
        function setSamples4Smooth(o,samples4Smooth)
            o.circuit.setSamples4Smooth(samples4Smooth);
        end
        
        function [remainingParameters] = setParameters(o,parameters)
            remainingParameters = o.circuit.setParameters(parameters);
        end
    end
end