function parameterValue=myfind(headerstr,missing_letter)


mystr=[headerstr,' ','D'];
l=size(mystr);
%find spaces
space_ind=find(mystr==' ');

% khazar: a vector giving place of spaces
%find H

data_ind=find(mystr==missing_letter,1);

if(isempty(data_ind))
    data_ind=l(2);
end

%find the next space after H

next_space=space_ind(find(space_ind>data_ind,1));
 if(isempty(next_space))
     next_space=l(2);
 end


%save the parameters from the header
param_data=mystr(data_ind+1:next_space-1);

%transform the string to a number
parameterValue = param_data;%str2num(param_data);


end