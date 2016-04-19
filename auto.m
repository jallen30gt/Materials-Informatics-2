clear
clc
stack_N50 = zeros(10,50,50,50);
for i = 2:10
    
    string1 = sprintf('N_split/voxel%d.mat',i);
    cont = Alicia3D(string1);
    close all
    save(string1, 'cont', '-append');
    %string2 = sprintf('S_%d_cont', i)
    %file = load(string1)

    level = graythresh(cont);
    seg = cont>level;
    save(string1, 'seg', '-append');
    stack_N50(i,:,:,:) = seg;
    
end