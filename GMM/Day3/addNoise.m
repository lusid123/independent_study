function []=addNoise(inFile,outFile,noiseFile,snr)
%function []=addNoise(inFile,outFile,noise,snr)
%inFile  - input speech file name.
%outFile - output noisy speech file name.
%noiseFile   - Noise file
%snr - required SNR.
		
	[sp fs]=wavread(inFile);
	noise=wavread(noiseFile);
	pos=floor(rand(1)*(length(noise)-length(sp)));
	n=noise(pos+1:pos+length(sp));
	n=n-mean(n);
	n=n/sqrt(var(n));
	vs=var(sp);
	vn = vs/(10^(snr/10));
	n=n*sqrt(vn);
	nsp=sp+n;
	wavwrite(nsp/(max(abs(nsp)*1.01)),fs,outFile);
