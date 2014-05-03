clear all;
clc;
allspk=dir('timitdata/*');
for i=3:length(allspk)
    str=allspk(i).name;
    mkdir(fullfile('traindata1',str));
    mkdir(fullfile('testdata1',str));
    wavall=dir(fullfile('timitdata',allspk(i).name,'*.wav'));
    for(j=1:7)   
        copyfile((fullfile('timitdata',allspk(i).name,wavall(j).name)),(fullfile('traindata1',str,sprintf('%d.wav',j))),'f');
    end;
        for(j=8:10)
         copyfile((fullfile('timitdata',allspk(i).name,wavall(j).name)),(fullfile('testdata1',str,sprintf('%d.wav',j))),'f');   
        end;
        
end;
