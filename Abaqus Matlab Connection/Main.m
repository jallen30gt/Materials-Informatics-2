%Created by J.T.B. Overvelde
%2012/05/03
%http://www.overvelde.com

clear, close all, clc;

%Variables
GridSpaceX=1;
GridSpaceY=1;
%mo='noGUI';
mo='script';

%Make python file with variables
delete('Var.py');
fid = fopen('Var.py', 'w');
fprintf(fid,'GridSpaceX = %0.12f\n',GridSpaceX);
fprintf(fid,'GridSpaceY = %0.12f\n',GridSpaceY);
fclose(fid);

%Make part(run Abaqus)
unix(['abaqus cae ',mo,'=Main.py']);   %Unix system
system(['abaqus cae ',mo,'=Main.py']); %Windows system?