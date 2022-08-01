function MotionEstimation( refFrame, curFrame, sz, bsize, searchRadius )

    % pad to ensure the image size is divisible by the block size
    rframe = padarray(refFrame,[bsize-1 bsize-1],0,'post');
    cframe = padarray(curFrame,[bsize-1 bsize-1],0,'post');
    % initialize empty motion vector matrices
    vmotion = zeros(sz);
    hmotion = zeros(sz);
    for i=1:bsize:sz(1)
        for j=1:bsize:sz(2)
            % TO BE ADDED
            % initialization of error and motion vectors
            ini_v = 0;
            ini_h = 0;
            err = sum(sum(abs(rframe(i:i+bsize-1,j:j+bsize-1,:)-cframe(i: i+bsize-1, j : j+bsize-1))));
            
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
                    err_tmp = sum(sum(abs(rframe(i:i+bsize-1,j:j+bsize-1,:) - cframe(i + vshift : i+bsize+vshift-1, j + hshift : j+bsize+hshift-1))));
                    if err_tmp < err
                        disp(err);
                        err = err_tmp;
                        ini_v = vshift;
                        ini_h = hshift;
                    end
                end
            end
            % TO BE ADDED
            % updating the motion vectors based onub8h the search result
            vmotion(i, j) = ini_v;
            hmotion(i, j) = ini_h;
        end
    end
    % produce a velocity plot of motion vectors (note the flipping of axis)
    quiver(flipud(hmotion),flipud(-vmotion),10)
    xlim([0 sz(2)])
    ylim([0 sz(1)])
end

