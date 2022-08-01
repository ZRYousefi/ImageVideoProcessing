% find_data.m example script for exercise 11 in SGN-12006
% juha.pajula@tut.fi

headerstr='YUV4MPEG2 W176 H144 F30000:1001 Ip A128:117'

%find spaces
space_ind=find(headerstr==' ')

%find H
missing_letter='H';
data_ind=find(headerstr==missing_letter)

%find the next space after H
next_space=space_ind(find(space_ind>data_ind,1))

%save the parameters from the header
param_data=headerstr(data_ind+1:next_space-1)

%transform the string to a number
H = str2num(param_data)
