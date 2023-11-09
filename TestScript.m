% TestCircuit.m
clear; clc; %close all;

PointToPointIncludes; % adds all folders to path

% Circuit Examples
circuit = Active2ndOrderLPF;

% CircuitChain Examples
%circuit = LPFClipper; 

% Open XML Circuit
%circuit = XMLCircuit('Active2ndOrderLPF.xml');

%saveXMLCircuit(circuit);

Fs = 48000; Ts = 1/Fs;
bufferSize = 0; 
circuit.prepare(Fs,bufferSize);

%%%%%%% TYPES OF ANALYSES (Set as many as you want to "true")
waveform = false;
frequencyResponse = true;
thdPlot = false;
dcSweep = false;

%%%%%%%


% WAVEFORM
if (waveform)
    
    f = 100;
    numOfCycles = 3;
    durSec = numOfCycles / f;
    t = [0:Ts:durSec].';
    x = sin(2*pi*f*t);
    [numSamples,channels] = size(x);

    for c = 1:channels
        [y] = circuit.process(x,numSamples,c);
    end
    
    t = [0:length(y)-1] * Ts;
    figure;
    plot(t,x,t,y);
    set(gca,'FontSize',14);
    title('Waveform');
    xlabel('Time (sec.)');
    ylabel('Amplitude');
    legend('Input','Output');
end

% FREQUENCY RESPONSE
if (frequencyResponse)
    
    x = [1;zeros(4095,1)];
    [numSamples,channels] = size(x);

    for c = 1:channels
        [y] = circuit.process(x,numSamples,c);
    end
    
    [H,W] = freqz(y,1,numSamples,Fs);
    Amp = 20*log10(abs(H));
    %figure;
    semilogx(W,Amp);
    axis([20 20000 -20 max(Amp)+5]);
    set(gca,'FontSize',14);
    title('Amplitude Reponse');
    xlabel('Freq. (Hz)');
    ylabel('Amplitude (dB)');
end

% THD 
if (thdPlot)
    f = 2000;
    numOfCycles = 200;
    durSec = numOfCycles / f;
    t = [0:Ts:durSec].';
    x = sin(2*pi*f*t);
    [numSamples,channels] = size(x);

    for c = 1:channels
        [y] = circuit.process(x,numSamples,c);
    end

    figure;
    thd(y,Fs);
end
 
% DC SWEEP
if (dcSweep)
    
    minValue = -1;
    maxValue = 1;
    stepSize = 0.01;
    
    x = [ minValue : stepSize : maxValue ].';
    [numSamples,channels] = size(x);

    for c = 1:channels
        [y] = circuit.process(x,numSamples,c);
    end
    
    figure;
    plot(x,x,x,y); 
    set(gca,'FontSize',14);
    title('DC Sweep');
    xlabel('Input Amplitude');
    ylabel('Output Amplitude');
    legend('Input','Output');
end
