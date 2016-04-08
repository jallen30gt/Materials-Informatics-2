
filename = input('What file to open? ', 's'); 

num = input('Number of Voxels?', 's');
num = str2double(num);

width = input('Voxel width?', 's');
n1 = str2double(width);

height = input('Voxel height?', 's');
n2 = str2double(height);

depth = input('Voxel depth?', 's');
n3 = str2double(depth);

binaryimage = matfile(filename);

[x,y,z] = size(binaryimage);

if (x <= n1 || y <= n2 || z <= n3)
    
    fprintf('Cannot Compute\n');
    return;
    
else
    
end
    

numvoxwidth = floor(x/n1);
numvoxheight = floor(y/n2);
numvoxdepth = floor(z/n3);

numvox = numvoxwidth*numvoxheight*numvoxdepth;

randxarray(1, num+1) = 0;
randyarray(1, num+1) = 0;
randzarray(1, num+1) = 0;

voxel(numvoxwidth, numvoxheight, numvoxdepth) = 0;

newdirectory = input('New directory name?', 's');
mkdir(newdirectory);
     
datafile = strcat('C:\Users\jallen30\Desktop\Grad Classes\CSE 8803 - Materials Informatics 2\Project\', newdirectory);
cd(datafile);

for i=1:num+1;    
         
     randxarray(1,i) = ceil(rand(1)*numvoxwidth);
     randyarray(1,i) = ceil(rand(1)*numvoxheight);
     randzarray(1,i) = ceil(rand(1)*numvoxdepth);
     
     if (i>1)
         for m=1:i-1;
            while(randxarray(1,i) == randxarray(1,m) && randyarray(1,i) == randyarray(1,m) && randzarray(1,i) == randzarray(1,m))
         
                randxarray(1,i) = ceil(rand(1)*numvoxwidth);
                randyarray(1,i) = ceil(rand(1)*numvoxheight);
                randzarray(1,i) = ceil(rand(1)*numvoxdepth);
        
            end     
         end
     else
         
     end
  
     for j=randxarray(1,i):randxarray(1,i)+numvoxwidth;
         
         for k=randyarray(1,i):randyarray(1,i)+numvoxheight;
             
             for l=randzarray(1,i):randxarray(1,i)+numvoxdepth;
                 
                 voxel(j,k,l) = binaryimage(j,k,l);
                 
             end
             
         end
          
     end
     
     if(i<num+1)
     
        newfilename = strcat('voxel', num2str(i));
     
        save(newfilename, voxel);
     
     else
         
     end
     
end


