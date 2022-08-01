function Y = Contrast_Stretch (X)
   X = double(X);
   X = X(:);
   min_img = min(X);
   max_img = max(X);
   minus = (X - min_img);
   minus1 = max_img - min_img;
   devition = minus ./ minus1;
   Y = uint8(255.*(devition));
   
end
