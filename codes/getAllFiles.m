% function fileList = getAllFiles(directoryName)
% dirData = dir(directoryName);
% dirIndex = [dirData.isdir];
% fileList = {dirData(~dirIndex).name};
% if ~isempty(fileList) 
%     fileList = cellfun(@(x) fullfile(directoryName,x),...
%         fileList, 'UniformOutput', false);
% end
% % subDirs = {dirData(dirIndex).name};
% % validIndex = ~ismember(subDirs,{'.', '..'});
% % 
% % for iDir = find(validIndex)
% %     nextDir = fullfile(directoryName, subDirs{iDir});
% %     fileList = [fileList; getAllFiles(nextDir)];
% % end
% end
function [fileList,index] = getAllFiles(directoryName)
dirData = dir(directoryName);
dirIndex = [dirData.isdir];
fileList = {dirData(~dirIndex).name};
if ~isempty(fileList) 
    fileList = cellfun(@(x) fullfile(directoryName,x),...
        fileList, 'UniformOutput', false);
end

position = zeros(size(fileList,2),1);
emotion = zeros(size(fileList,2),1);
glass = zeros(size(fileList,2),1);
name = zeros(size(fileList,2), 1);
% position1 = 'left';
% position2 = 'right';
% position3 = 'up';
% position4 = 'straight'
% emotion1  = 'angry';
% emotion2  = 'happy';
% emotion3  = 'neutral';
% emotion4  = 'sad';
% glass1    = 'open';
% glass2    = 'sunglasses';
for i = 2 : size(fileList,2)
    left = strfind(fileList(i), 'left');
    right = strfind(fileList(i), 'right');
    up = strfind(fileList(i), 'up');
    straight = strfind(fileList(i), 'straight');
    if(size(cell2mat(left),1) ~= 0) 
        position(i) = 1;
    end
    if(size(cell2mat(right),1) ~= 0) 
        position(i) = 2;
    end
     if(size(cell2mat(up),1) ~= 0) 
        position(i) = 3;
     end
     if(size(cell2mat(straight),1) ~= 0) 
        position(i) = 4;
    end
    
    
    angry = strfind(fileList(i), 'angry');
    if(size(cell2mat(angry),1) ~= 0) 
        emotion(i) = 1;
    end
    happy = strfind(fileList(i), 'happy');
    if(size(cell2mat(happy),1) ~= 0) 
        emotion(i) = 2;
    end
    neutral = strfind(fileList(i), 'neutral');
    if(size(cell2mat(neutral),1) ~= 0) 
        emotion(i) = 3;
    end
    sad = strfind(fileList(i), 'sad');
    if(size(cell2mat(sad),1) ~= 0) 
        emotion(i) = 4;
    end
    
    open = strfind(fileList(i), 'open');
    if(size(cell2mat(open),1) ~= 0) 
        glass(i) = 1;
    end
    sunglasses = strfind(fileList(i), 'sunglasses');
    if(size(cell2mat(sunglasses),1) ~= 0) 
        glass(i) = 2;
    end
    
     % name
    an2i = strfind(fileList(i), 'an2i');
    if(size(cell2mat(an2i),1) ~= 0) 
        name(i) = 1;
    end
    at33 = strfind(fileList(i), 'at33');
    if(size(cell2mat(at33),1) ~= 0) 
        name(i) = 2;
    end
    boland = strfind(fileList(i), 'boland');
    if(size(cell2mat(boland),1) ~= 0) 
        name(i) = 3;
    end
    bpm = strfind(fileList(i), 'bpm');
    if(size(cell2mat(bpm),1) ~= 0) 
        name(i) = 4;
    end
    ch4f = strfind(fileList(i), 'ch4f');
    if(size(cell2mat(ch4f),1) ~= 0) 
        name(i) = 5;
    end
    cheyer = strfind(fileList(i), 'cheyer');
    if(size(cell2mat(cheyer),1) ~= 0) 
        name(i) = 6;
    end
    choon = strfind(fileList(i), 'choon');
    if(size(cell2mat(choon),1) ~= 0) 
        name(i) = 7;
    end
    danieln = strfind(fileList(i), 'danieln');
    if(size(cell2mat(danieln),1) ~= 0) 
        name(i) = 8;
    end
    glickman = strfind(fileList(i), 'glickman');
    if(size(cell2mat(glickman),1) ~= 0) 
        name(i) = 9;
    end
    karyadi = strfind(fileList(i), 'karyadi');
    if(size(cell2mat(karyadi),1) ~= 0) 
        name(i) = 10;
    end
    kawamura = strfind(fileList(i), 'kawamura');
    if(size(cell2mat(kawamura),1) ~= 0) 
        name(i) = 11;
    end
    kk49 = strfind(fileList(i), 'kk49');
    if(size(cell2mat(kk49),1) ~= 0) 
        name(i) = 12;
    end
    megak = strfind(fileList(i), 'megak');
    if(size(cell2mat(megak),1) ~= 0) 
        name(i) = 13;
    end
    mitchell = strfind(fileList(i), 'mitchell');
    if(size(cell2mat(mitchell),1) ~= 0) 
        name(i) = 14;
    end
    night = strfind(fileList(i), 'night');
    if(size(cell2mat(night),1) ~= 0) 
        name(i) = 15;
    end
    phoebe = strfind(fileList(i), 'phoebe');
    if(size(cell2mat(phoebe),1) ~= 0) 
        name(i) = 16;
    end
    saavik = strfind(fileList(i), 'saavik');
    if(size(cell2mat(saavik),1) ~= 0) 
        name(i) = 17;
    end
    steffi = strfind(fileList(i), 'steffi');
    if(size(cell2mat(steffi),1) ~= 0) 
        name(i) = 18;
    end
    sz24 = strfind(fileList(i), 'sz24');
    if(size(cell2mat(sz24),1) ~= 0) 
        name(i) = 19;
    end
    tammo = strfind(fileList(i), 'tammo');
    if(size(cell2mat(tammo),1) ~= 0) 
        name(i) = 20;
    end
    
end
index = [position, emotion, glass, name];
end