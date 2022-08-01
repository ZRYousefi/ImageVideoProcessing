function h = BWLPfilterh(image, cutoff, n)
    
[rows,cols] = size(image);
[u,v] = meshgrid(1:1:cols,1:1:rows);
D = sqrt( (u-cols/2).^2 + (v-rows/2).^2 );
h =1-( 1./(1+((D./cutoff).^(2*n))));
%