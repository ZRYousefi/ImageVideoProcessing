clc
close all
clear all

% example_code.m file
% draft file for SGN-12006 Exercise 12
% Juha Pajula,
% Tampere University of Technology, 
% Department of Signal Processing 

% read the filenames from the folder (or define them by hand):
    
%insert used code here or...

	filename =('/home/sheikhip/Documents/Basic Image/Ex12/akiyo_qcif.y4m');

% reading the file header
    %Close the file handle after this (fclose).
	fid = fopen(filename,'r');
	%reading data from the beginning of the file:
	datavector=fread(fid,100,'uint8');
	%closing the open file:
	fclose(fid);	

	%pre-processing the header
	headerline=char(datavector');
	keyword='FRAME';
	%searching where the frame data begins
	index=strfind(headerline,keyword);
	%read only the header
	header=headerline(1:index-2)
	

% process the header here:
% find W, H, F, I, A and C variables from header 
%Use the code from exercise 11:
%header variable here corresponds to the single string variable parameters(x).header in exercise 11

    field1 = 'W';  value1 = 0;
    field2 = 'H';  value2 = 0;
    field3 = 'F';  value3 = 0;
    field4 = 'I';  value4 = 0;
    field5 = 'A';  value5 = 0;
    field6 = 'C';  value6 = 0;
    field=['W','H','F','I','A','C'];
    parameters = struct(field1,[],field2,[],field3,[],field4,[],...
        field5,[],field6,[]);
    parameters(3).W=5;
    % Create a for -loop 
    % where all headers in videofileinfo are processed
    % and variables are saved to paramters struct

    load('videofileinfo');
    v=length(videofileinfo);

    %  headerstr='YUV4MPEG2 W176 H144 Ip F30000:1001 A128:117';
    %  mystr=[headerstr,' ','D'];
    %  mystr; 
    %    missing_letter='C';
    %   data_ind=find(headerstr==missing_letter)
    %   parameterValue=myfind(headerstr,missing_letter)
    for i=1:v % for part 3 change the plavce of end
        headerstr=videofileinfo(i).header;

        missing_letter='W';
        parameterValue=myfind(headerstr,missing_letter);
        parameterValue=str2double(parameterValue);
        parameters(i).W=parameterValue;

        missing_letter='H';
        parameterValue=myfind(headerstr,missing_letter);
        parameterValue=str2double(parameterValue);
        parameters(i).H=parameterValue;

        missing_letter='F';
        parameterValue=myfind(headerstr,missing_letter);
        parameters(i).F=parameterValue;

        missing_letter='I';
        parameterValue=myfind(headerstr,missing_letter);
        parameters(i).I=parameterValue;

        missing_letter='A';
        parameterValue=myfind(headerstr,missing_letter);
        parameters(i).A=parameterValue;

        missing_letter='C';
        parameterValue=myfind(headerstr,missing_letter);

            if(isempty(parameterValue))
                parameterValue='420';
            end

        parameters(i).C=parameterValue;
    end

    % read the image data for processing:

        %define cols and rows according to the header
        cols =176; 		%fill here
        rows =144;	    %fill here

        Nmax=300; 			%number of frames to read max
        fid = fopen(filename,'r'); 	%open the file
        keyword='FRAME';		%the frame tag to search for

    %computing the segment length:
        segmentlength = (rows*cols*1.5)+length(keyword)+1;

        %searching the first index
        firstindex=strfind(char(datavector)',keyword);

        %variable for locations, first column defines index number, second the location
        locations=[1 2];

        %searching the frame locations:
    for frameindex=1 : Nmax
        location=(frameindex-1)*segmentlength+firstindex;
        locations=cat(1,locations,[frameindex location]); %collect the frame locations to 2 x Nmax vector
        %

        %the first location is false and thus left out
        locations=locations(2:end,:) 


        %reading the image data from frame 1
        %frameindex=1;
        pointeroffset=locations(1,2)+length(keyword);
        %moving the pointer to correct location:
        status=fseek(fid,pointeroffset,'bof');
        %read the frame data
        datavector=fread(fid,segmentlength-length(keyword)-1,'uint8');
        %check that the length is correct:
        length(datavector)+ length(keyword)+1
        segmentlength


        % reading the frame components from the datavector:
        %where it starts	
        aa=1;
        bb=rows*cols;

        %reading the Y component
        yy=datavector(aa:bb);

        %where next component starts
        cc=length(yy)+1;
        dd=length(yy)+((rows/2)*(cols/2));

        %reading the U component
        uu=datavector(cc:dd);

        %where the last component starts
        ee=length(yy)+length(uu)+1;
        ff=length(yy)+length(uu)+((rows/2)*(cols/2));

        %reading the V component
        vv=datavector(ee:ff);



        % construct image:
        %Use the code from Task I to costruct the image
        size=cols*rows;
        Y=reshape(yy,[cols rows]);
        uu_reshape=reshape(uu,[cols/2 rows/2]);
        vv_reshape=reshape(vv,[cols/2 rows/2]);

        U=imresize(uu_reshape,[cols rows]);
        V=imresize(vv_reshape,[cols rows]);


%         subplot(131);imshow(uint8(Y)');title('yy reshape')
%         subplot(132);imshow(uint8(U)');title('uu reshape')
%         subplot(133);imshow(uint8(V)');title('vv reshape')

        U = U-127;
        V=V-127;

        YUV = cat(2,Y(:),U(:),V(:));
        yuvToRgb=[1     0         1.402;
                  1    -0.34413   -0.71414;
                  1     1.772    0       ];
        RGB = yuvToRgb * YUV';
        R=reshape(RGB(1,:),[cols rows]);
        G=reshape(RGB(2,:),[cols rows]);
        B=reshape(RGB(3,:),[cols rows]);

        i=cat(3,R',G',B');
     
        I=uint8(i);
        imshow(I)
    end

%g) Create a function based on earlier phases: (2 points) 
%[rgbframe]=readframe(fid,location, length), which reads and processes one frame from the file stream 
%pointed by fid from the defined location and data length. The function returns uint8 RGB frame ready for 
%visualization. 




%h) Similarly as in Exercise 10, create a video in the Figure window with a for -loop using the readframe-
%function. Now the frame is aquired from the readframe-function instead of cell table of Exercise 10. View the 
%first 50 frames of the videofile using the computed frame locations and the length of image data


