% ex1.m example code for SGN-12006 course  
% formats.mat should be in the same forlder with this script
% juha.pajula@tut.fi

%load the matfile
load formats
disp('Showing the structure of data in "formats" variable:')
disp(' ')

formats

disp(' ')
disp('The fields inside the formats-variable:')
for k = 1:max(size(formats))
    horsize = formats(k).horizontalsize;
    vertsize = formats(k).verticalsize;
    disp([formats(k).name,' ',num2str(horsize),' x ',num2str(vertsize)])
end
