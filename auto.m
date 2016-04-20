clear
clc
stack_N1004 = zeros(100,100,100,100);
for i = 1:100
    
    string1 = sprintf('N_1004/voxel%d.mat',i);
    cont = Alicia3D(string1);
    close all
    save(string1, 'cont', '-append');
    %string2 = sprintf('S_%d_cont', i)
    %file = load(string1)

    level = graythresh(cont);
    seg = cont>level;
    save(string1, 'seg', '-append');
    stack_N1004(i,:,:,:) = seg;
    
end