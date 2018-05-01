imaqreset;
rehash;
close all
clear

%Robot Initialization
 arrobot_disconnect +%%serial connection needs to be broken before attempting to connect again
% clear all 
 aria_init 
 arrobot_connect

%%%Camera Initialize
cam = videoinput('winvideo', 1,'YUY2_640x480' );                                           %%%YUY2_640x480 for infrared sensor
cam.FramesPerTrigger = 60;
cam.ReturnedColorSpace = 'grayscale';
triggerconfig(cam,'manual');
start(cam);

%%%TCP Server Initialize
tcp = tcpip('172.23.78.106', 30000, 'NetworkRole', 'server');     %previous 10.248.48.195            %% Creates TCP Connection with client
set(tcp,'OutputBufferSize',83700)
set(tcp,'timeout',0.1)
fopen(tcp); 

run = 0;
ran=0;
commandlength=10;
commands=zeros(1,commandlength);
commands(1)=1;
% mypi = raspi('169.254.0.2','pi','raspberry');
mypi2=raspi('10.248.85.215','pi','raspberry');
pan_center_count=0;
pan_count = 0;

% while run==0 
% check=isempty(commands);
% if ran==1 && check==0;
%     commands=fread(tcp,commandlength);
%     commands = commands';
%     if commands(1)==1
%         run=1;
%     else
%         run=0;

%     end
%     else 
%         run=1;
% end

% addpath(genpath('PHUE_Connect'))
% [urlLIGHT_State, lights_ALL_INFO, ErrCode, Hue_IP, AppID] = Philips_HUE_CONNECT(0);
% urlLIGHT_First = urlLIGHT_State(1:end-5);
% 
% %Light1=strcat(urlLIGHT_State(1:end-7),'1/state');
% Light2=strcat(urlLIGHT_State(1:end-7),'2/state');
% %Light3=strcat(urlLIGHT_State(1:end-7),'3/state');

while(1)

      cam_snap = getsnapshot(cam);
      imshow(cam_snap)
%       cam_snap = image_Binarize(cam_snap); 
      cam_snap=uint8(cam_snap);
      cam_snap=imresize(cam_snap,[227,227]);
      %cam_snap=imresize(cam_snap,[256,256]);                                                  %% Resizing image for transmission
      cam_snap=cam_snap(:);   
      if isempty(commands) == 0 
      fwrite(tcp, cam_snap,'uint8')                                                 %% Transmitting the data
      end
      commands = fread(tcp,commandlength);
      commands = commands';

if isempty(commands)==0
      move = num2str(commands(6:commandlength));
      pan = num2str(commands(2:3));
      pan_center = num2str(commands(4:5));
      
%       configurePin(mypi,5,'DigitalOutput');
%       configurePin(mypi,26,'DigitalOutput');
%       configurePin(mypi,25,'DigitalOutput');
      configurePin(mypi2,5,'DigitalOutput');
      configurePin(mypi2,26,'DigitalOutput');
      configurePin(mypi2,24,'DigitalOutput');
      configurePin(mypi2,22,'DigitalOutput');
      configurePin(mypi2,23,'DigitalOutput');

        switch move
            case '1  0  0  0  0'                                               
                %disp('forward')
                arrobot_setvel(30);
                writeDigitalPin(mypi2,24,1);

            case '0  1  0  0  0'
                %disp('right')
                arrobot_setrotvel(10)
                writeDigitalPin(mypi2,26,1);

            case '0  0  1  0  0'
                %disp('left');  
                arrobot_setrotvel(-10)
                %writeDigitalPin(mypi2,22,1);
            case '0  0  0  1  0'
                %disp('left');  
                writeDigitalPin(mypi2,23,1);
                %arrobot_setvel(-20)
                
            case '0  0  0  0  1'
                writeDigitalPin(mypi2,22,1);
                
            otherwise
                arrobot_setvel(0)
                arrobot_setrotvel(0)
                writeDigitalPin(mypi2,24,0);
                writeDigitalPin(mypi2,26,0);
                writeDigitalPin(mypi2,22,0);
                writeDigitalPin(mypi2,23,0);
        end
    
    if strcmp(pan,'1  0') || strcmp(pan,'0  1')
        pan_count=pan_count+1;
    end
        
%    if pan_count == 1
%         switch pan
%             case '1  0'
%                 disp('pan right');
%                 writeDigitalPin(mypi,26,1);        
%                 pan_count=0;
%             case '0  1'
%                 disp('pan left');
%                 writeDigitalPin(mypi,25,1);
%                 pan_count=0;
%                 
%             otherwise
%                 writeDigitalPin(mypi,26,0);
%                 writeDigitalPin(mypi,25,0);
%                 pan_count=0;
%                 
%         end      
%         
%    end
%    
%         if strcmp(pan_center,'1  0') || strcmp(pan_center,'0  1')
%         pan_center_count=pan_center_count+1;
%         end
%         
%         if pan_center_count == 1
%         switch pan_center
%             case '1  0'
%                 disp('pan right');
%                 writeDigitalPin(mypi,26,1);      
%                 pan_center_count=0;
% 
%             case '0  1'
%                 disp('pan left');
%                 writeDigitalPin(mypi,25,1);
%                 pan_center_count=0;
%                 
%             otherwise
%                 writeDigitalPin(mypi,26,0);
%                 writeDigitalPin(mypi,25,0);
%                 pan_center_count=0;
%         end
%                 
%         end      
    run=commands(1); 
end

%  writeDigitalPin(mypi,26,0);
%  writeDigitalPin(mypi,25,0);
%    
ran=1;
end 
% end
