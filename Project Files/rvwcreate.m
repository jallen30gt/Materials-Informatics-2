
filename = input('What file to open? ', 's'); 

num = input('Number of Voxels?', 's');
num = str2double(num);

width = input('Voxel width?', 's');
n1 = str2double(width);

height = input('Voxel height?', 's');
n2 = str2double(height);

depth = input('Voxel depth?', 's');
n3 = str2double(depth);

binaryimage = load(filename);

variable = fields(binaryimage);

[x,y,z] = size(binaryimage.(variable{1}));

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

voxel(n1, n2, n3) = 0;

newdirectory = input('New directory name?', 's');
mkdir(newdirectory);
     
datafile = strcat('C:\Users\jallen30\Desktop\Grad Classes\CSE 8803 - Materials Informatics 2\Project\', newdirectory);
cd(datafile);

coords{1, num} = 0;
counter = 1;

     for r=1:numvoxheight;
         
         for s=1:numvoxwidth;
             
             for t=1:numvoxheight;
                 
                 coords{counter} = [r,s,t];
                 counter = counter + 1;                 
                 
             end
             
         end
          
     end
     
     
numspicked(1, num) = 0;
     
for i=1:num;    
    
    pick = ceil(rand(1)*numvox);
    numspicked(1, i) = pick;
         
    while(pick == numspicked);
      
          pick = ceil(rand(1)*numvox);
          numspicked(1, i) = pick;  
        
    end
    
    
  
     for j=1:n1;
         
         for k=1:n2;
             
             for l=1:n3;
                 
                 voxel(j,k,l) = binaryimage.(variable{1})((coords{numspicked(i)}(1))+(j-1),(coords{numspicked(i)}(2))+(k-1),(coords{numspicked(i)}(3))+(l-1));
                 
             end
             
         end
          
     end
     
       
        newfilename = strcat('voxel', num2str(i));
     
        save(newfilename, 'voxel');
  
end


