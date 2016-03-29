function tsd_out = emotiv_to_tsd(hdr,data)
% function tsd_out = emotiv_to_tsd(hdr,data)
%
% convert Emotiv data to tsd format

nCh = size(data,1);
nSamples = size(data,2);

if length(unique(hdr.samples)) > 1
   error('Different sampling rates found'); 
else
   Fs = unique(hdr.samples); 
end

tsd_out = tsd;
tsd_out.data = data;
tsd_out.label = hdr.label;

tsd_out.tvec = 0:1/Fs:hdr.records-(1/Fs);

