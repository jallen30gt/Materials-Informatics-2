function [out] = Alicia3D(string)
    addpath('coherencefilter_version5b')
    addpath('coherencefilter_version5b/functions')
    addpath('coherencefilter_version5b/functions3d')

    ND = load(string);
    ND = ND.voxel;
    NDg = mat2gray(ND);
    ndgs = single(NDg);
    showcs3(ndgs)

    % Coherence Filter
    Options = struct(); % This is where the options for diffusion filtering go
    Options.Scheme = 'R';
    Options.T = 10;
    Options.dt = 1;
    Options.sigma = 0.5;
    Options.rho = 1;

    ndf2 = CoherenceFilter(ndgs,Options);
    % showcs3(ndf2)

    % Top Hat Filter
    ndf2th = imtophat(ndf2,strel(ones(3,3,3)));
    showcs3(ndf2th)

    % Adjust Contrast
    Im = ndf2th;
    a = Im(:,:,1);
    Im = reshape(Im,size(Im,1),[]);
    out = imadjust(Im);     %// applying imadjust
    %// finally reshaping back to its original shapeX5_c
    out = reshape(out,size(a,1),size(a,2),[]);
    showcs3(out)

    % Calculate the gradients
    usigma = ndf2;
    ux=derivatives(usigma,'x');
    uy=derivatives(usigma,'y');
    uz=derivatives(usigma,'z');
    % Compute the 3D structure tensors J of the image
    [Jxx, Jxy, Jxz, Jyy, Jyz, Jzz] = StructureTensor3D(ux,uy,uz, 2);
    Jxxa = mean(Jxx(:));
    Jxya = mean(Jxy(:));
    Jxza = mean(Jxz(:));
    Jyya = mean(Jyy(:));
    Jyza = mean(Jyz(:));
    Jzza = mean(Jzz(:));
    Ja = [Jxxa, Jxya, Jxza; Jxya, Jyya, Jyza; Jxza, Jyza, Jzza];
    [je, jv] = eig(Ja);
    JJ = cat(4,Jxx, Jxy, Jxz, Jxy, Jyy, Jyz, Jxz, Jyz, Jzz);
end