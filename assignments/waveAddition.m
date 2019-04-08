function waveAddition
% draws the addition plot of two face-to-face moving waves
% author:Cocca 
% time : 2019/03/15
x_m = 10;                                       %the maximum of the x-axis
x_s = -10;                                      %the minimum of the x-axis
speed = 5.0;                                    %the speed of the motion
t_m = 4;                                       %the maximum time vaule
videoWriter = VideoWriter('hw_3_1.avi');        %save file name 
open(videoWriter);                              %open file writer stream
x = x_s:(x_m-x_s)/1000:x_m;
try
for t = 0:0.02:t_m
  plot(x,circ(x,t*speed)+tri(x,t*speed));
  axis([x_s x_m x_s x_m])
  axis equal
  this = getframe;                              %get frame of this scene
  writeVideo(videoWriter,this);                 %write file
end
catch                                        %deal with IOExceptions
close(videoWriter);                             %close resourses
delete('hw_3_1.avi');                           %release useless resourses
end
close(videoWriter);                         %close resourses
end

function Y_circ = circ(X_circ,t)                %draw the circle
x = (X_circ(1)+X_circ+t);                       %calculate the domain by time
x1 = ((x>-2)&(x<2));                         %calculate the extent of circle on x-axis
Y_circ = sqrt(4-(x1.*x).^2).*x1;
end

function Y_tri = tri(X_tri,t)                            %draw the triangle
x = (X_tri(end)+X_tri-t);
x1 = (x<2/sqrt(3))&(x>0);
x2 = (x>-2/sqrt(3))&(x<=0);
y1 = (-sqrt(3)*x1.*x+2).*x1;                             %right side of the plot
y2 = (sqrt(3)*x2.*x+2).*x2;                              %left side
Y_tri = y1+y2;
end


