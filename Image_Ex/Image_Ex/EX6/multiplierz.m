function multiplierz(C)

    [m, n] = size(C);
    colormap('gray');
    for i=1:m
        for j=1:n
            subplot(n,n,n*(i-1)+j);
            imagesc(C(:,i)*C(:,j)');
            %axis off;
        end
    end

end

