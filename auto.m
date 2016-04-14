clear
clc
for i = 1:10
    
    string1 = sprintf('S100_split/voxel%d.mat',i);
    cont = Alicia3D(string1);
    close all
    save(string1, 'cont', '-append');
    %string2 = sprintf('S_%d_cont', i)
    %file = load(string1)

    level = graythresh(cont)
    seg = cont>level;
    save(string1, 'seg', '-append');
    
end