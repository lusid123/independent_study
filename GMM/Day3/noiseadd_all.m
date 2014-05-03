%anil
%Program to add noise to speech signal from the noise file
%recognition

fclose('all');
clear all;
clc;
spath=('C:\Users\Personal\Desktop\spkrec_TIMIT\Day3\testwavdata');
tpath=('C:\Users\Personal\Desktop\spkrec_TIMIT\Day3\testwavdata_noise10db_w');
npath=('C:\Users\Personal\Desktop\spkrec_TIMIT\Day3\noisex');

    spall=dir('C:\Users\Personal\Desktop\spkrec_TIMIT\Day3\testwavdata');
    for(j=3:length(spall))
        sp=spall(j).name;
        utall=dir(fullfile(spath,sp,'*.wav'));
        for(k=1:length(utall))
            ut=utall(k).name;
            fprintf(1,'Processing %s\n',ut);
            addNoise(fullfile(spath,sp,ut),fullfile(tpath,sp,ut),fullfile(npath,'white.wav'),10)
            clear ut;
        end;
        clear utall;
    end
    fclose('all');
    clear spall;





