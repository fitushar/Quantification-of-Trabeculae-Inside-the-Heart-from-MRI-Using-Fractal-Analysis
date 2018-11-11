%segs and images contain respectively the manual segmentations and the
%corresponding 4D image.
%max_intensity adjusts the displayed intensity values for better visualization. A value
%of 500 works fine for most sequences. 
%z_pos and time_pos contain respectively the long axis slice number and
%temporal frame number that we wish to visualize.
function show_segs(segs,images,max_intensity,z_pos,time_pos)

[s_zval s_tval] = size(segs);
[i_yval i_xval i_zval i_tval] = size(images);



if(s_zval ~= i_zval || s_tval~=i_tval)
    disp('error');
    return;
end;

picture = reshape(images(:,:,z_pos,time_pos),256,256);
imshow(picture,[0 max_intensity]);       

temp = segs{z_pos,time_pos};
[sx sy] = size(temp);

if(temp(1,1)~=-99999)
half=(sx-1)/2;

pointsXendo = [temp(1:half,1);temp(1,1)];
pointsYendo = [temp(1:half,2);temp(1,2)];
pointsXepi = [temp(half+2:2*half+1,1);temp(half+2,1)];
pointsYepi = [temp(half+2:2*half+1,2);temp(half+2,2)];


[stemp1 stemp2] = size(pointsXendo);
a1=linspace(0,1,stemp1);
sampling_data_endo=zeros(1000,2);
sampling_data_epi=zeros(1000,2);
b1 = linspace(0,1,1000);

sampling_data_endo(:,1) = interp1(a1,pointsXendo,b1,'spline')';
sampling_data_endo(:,2) = interp1(a1,pointsYendo,b1,'spline')';
sampling_data_epi(:,1) = interp1(a1,pointsXepi,b1,'spline')';
sampling_data_epi(:,2) = interp1(a1,pointsYepi,b1,'spline')';

dots = sampling_data_endo;
for a=1:999
    line([dots(a,1);dots(a+1,1)],[dots(a,2);dots(a+1,2)],'Color','r'); %endo
end;
line([dots(1000,1);dots(1,1)],[dots(1000,2);dots(1,2)],'Color','r'); %endo


dots = sampling_data_epi;
for a=1:999
    line([dots(a,1);dots(a+1,1)],[dots(a,2);dots(a+1,2)],'Color','g'); %epi
end;
line([dots(1000,1);dots(1,1)],[dots(1000,2);dots(1,2)],'Color','g'); %epi
end;
pause(0.25);
    