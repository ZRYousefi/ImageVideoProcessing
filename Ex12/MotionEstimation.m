function MotionEstimation( refFrame, curFrame, sz, bsize, searchRadius )

    % pad to ensure the image size is divisible by the block size
    rframe = padarray(refFrame,[bsize-1 bsize-1],0,'post');
    cframe = padarray(curFrame,[bsize-1 bsize-1],0,'post');
    % initialize empty motion vector matrices
    vmotion = zeros(sz);
    hmotion = zeros(sz);
    for i=1:bsize:sz(1)
        for j=1:bsize:sz(2)
            % this is a block of the reference image
            rblock = rframe(i:i+bsize-1,j:j+bsize-1,:);
            
            % TO BE ADDED
            % initialization of error and motion vectors
            MAD_min = 256;
            dy = 0;
            dx = 0; 
            % setting the bounds of the search region
            lbound = min([searchRadius, j-1]);
            rbound = min([searchRadius, sz(2)-j]);
            ubound = min([searchRadius, i-1]);
            dbound = min([searchRadius, sz(1)-i]);
            for vshift=-ubound:dbound
                for hshift=-lbound:rbound
                    % TO BE ADDED
                    % extracting the block from the current frame
                    % calculating and updating the current values for
                    % the error and motion vectors
                    MAD = sum(sum(abs(refFrame(i:i+bsize-1,j:j+bsize-1)-curFrame(i+vshift:i+vshift+bsize-1,j+hshift:j+hshift+bsize-1))));
% calculate MAD for this candidate
                    if MAD<MAD_min
                        MAD_min=MAD;
                        dy=vshift;
                        dx=hshift; 
                    end
                end
            end
            % TO BE ADDED
            % updating the motion vectors based on the search result
            fp(i:i+bsize-1,j:j+bsize-1)= curFrame(i+dy:i+dy+bsize-1,j+dx:j+dx+bsize-1);
%put the best matching block in the predicted image
 iblk=(floor(i-1)/bsize+1)+1; 
 jblk=(floor(j-1)/bsize+1)+1; %block index
 hmotion(iblk,jblk)=dx; 
 Vmotion(iblk,jblk)=dy; %record the estimated MV
 
        end
    end
    % produce a velocity plot of motion vectors (note the flipping of axis)
    quiver(flipud(hmotion),flipud(-vmotion),10)
    xlim([0 sz(2)])
    ylim([0 sz(1)])
end

