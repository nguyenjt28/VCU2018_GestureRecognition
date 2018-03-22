function varargout = GUI(varargin)
%GUI MATLAB code file for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('Property','Value',...) creates a new GUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to GUI_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      GUI('CALLBACK') and GUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in GUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 13-Mar-2018 17:35:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT



% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% handles.timer = timer(...
%     'ExecutionMode', 'fixedRate', ...       % Run timer repeatedly.
%     'Period', 1, ...                        % Initial period is 1 sec.
%     'TimerFcn', {@update_display,hObject}); % Specify callback function.
% 
% start(handles.timer)

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles)
global terminate;
global started;
global stage;
stage=0;
terminate = 0;
started = 0;
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(handles.uipanel2,'Visible','off')
set(handles.uipanel4,'Visible','off')
set(handles.uipanel6,'Visible','off')
    
% while(1)  
%     
% if terminate == 1
%     return
% end
% pop3value=get(handles.popupmenu3,'Value');
% image=imread(char(strcat(newfiles(pop3value),'\image_10.jpg')));
% image2=imread(char(strcat(char(filename),char(strcat('\','Both Hands')),char('\image_10.jpg'))));
% axes(handles.axes1)
% imshow(image)
% axes(handles.axes2)
% imshow(image2)
% drawnow();


% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3

filename=strcat(char(pwd),char('\data'));
directory=dir(filename)
files=strings(1,length(directory));

for i=1:length(directory)
   file=directory(i);
   files(i)=file.name;
end

files=files(3:length(directory));
newfiles=strings(1,length(files));

for i=1:length(files)
    newfiles(i)=char(strcat(char(filename),char(strcat('\',files(i)))));
end

test='Hi Test'

set(handles.popupmenu3,'String',files)

% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel2,'Visible','on')
set(handles.uipanel3,'Visible','off')


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel2,'Visible','off')
set(handles.uipanel3,'Visible','on')


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
global terminate;
global started;
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
terminate=1;


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
global terminate;
global started;
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
test(handles);
started = 1;


function test(handles)
global stage %stage is a global variable used to determine what windows in the GUI main should be hidden dependent on location in code EG. Gesture creation/training/execution are stages 0,1,2 respectively 
stage=0;
global pb7;
pb7=0;
commandlength=9;
tcp = tcpip('172.23.42.17', 30000, 'NetworkRole', 'client');
% tcp = tcpip('192.168.0.101', 30000, 'NetworkRole', 'client');
set(tcp,'InputBufferSize',83700);
set(tcp,'Timeout',30);
fopen(tcp);

gesture=zeros(1,commandlength-4);                                                        %%%Number of gestures currently implemented
timebuffer = 0;
gesturetest = 1;
VBuffer = 50;                                                              %%%VBuffer is the difference in vertical pixels between extremeties
HBuffer = 70;    
commands = zeros(1,commandlength);

savepath=cd;

if(false) %Used for Hue Lights
    addpath(genpath('PHUE_Connect'))

    [urlLIGHT_State, lights_ALL_INFO, ErrCode, Hue_IP, AppID] = Philips_HUE_CONNECT(0);
    urlLIGHT_First = urlLIGHT_State(1:end-5);

    Light1=strcat(urlLIGHT_State(1:end-7),'1/state');
    Light2=strcat(urlLIGHT_State(1:end-7),'2/state');
    Light3=strcat(urlLIGHT_State(1:end-7),'3/state');
end

try cd Data
    cd ..
    savepath=strcat(savepath,'\Data\');
catch
     mkdir(savepath, 'Data'); %Create a new directory called 'Data' in current directory to store images
     savepath=strcat(savepath,'\Data\');
     fprintf('\n%s Created\n\n',savepath(1:end-1))
end

pause(0.5)

NG=0; %New Gesture Indicator

set(handles.axes1,'Visible','off')
set(handles.axes2,'Visible','off')
set(handles.uipanel4,'Visible','on')
set(handles.uipanel6,'Visible','on')

set(handles.text4,'String','New Gesture (Y/N): ')
%str=input('New Gesture (Y/N): ', 's');
pause(0.5)

stage=1;
temp=0;

while(temp==0)
    pause(0.2)
    if strcmp(char(pb7),char('N')) || strcmp(char(pb7),char('Y'))
       temp=1;
    end
end
temp=0;


while(strcmp(char(pb7),char('Y')))
   set(handles.edit1,'String','')
   pb7="";
   pause(0.2)
   NG=NG+1; %Triggers optional conditional at end of file to delete new gesture
   set(handles.text4,'String','What is the name of new gesture?: ')
   while(temp==0)
    pause(0.2)
        if strcmp(char(pb7),'')
           temp=0;
        else
           temp=1;
        end
    end
   temp=0;
   str=char(pb7);
   %str=input('\nWhat is the name of new gesture?: ', 's');
   FileName(1,NG)=string(pb7);
   set(handles.edit1,'String','')
   pb7="";
   mkdir(savepath, char(FileName(1,NG))); %Change directory location accordingly for where training images should be saved
   fprintf(sprintf('\nGesture ''%s'' Created\n', char(FileName(1,NG))))
   str2=sprintf('Gesture ''%s'' Created\n', char(FileName(1,NG)));
   str2=str2+"\n"+"How much delay time (seconds) is required?: ";
   set(handles.text4,'String',compose(str2))
   while(temp==0)
    pause(0.2)
        if strcmp(char(pb7),'')
           temp=0;
        else
           temp=1;
        end
    end
    temp=0;
   %Delay=input('\nHow much delay time (seconds) is required?: ');
   Delay=str2num(pb7);
   pb7="";
   set(handles.edit1,'String','')
   set(handles.axes1,'Visible','on')
   CreateImages(Delay,100,str,tcp,commands,savepath);  %(Delay - Time before photos are taken, Number of photos to be taken, Name of Gesture)
   close(figure(1))
   set(handles.text4,'String','Capture complete! Would you like to create another gesture? (Y/N): ')
   %str=input('\nCapture complete! Would you like to create another gesture? (Y/N): ', 's');
   while(temp==0)
    pause(0.2)
        if strcmp(char(pb7),'')
           temp=0;
        else
           temp=1;
        end
    end
    temp=0;
    fwrite(tcp,commands);
end

pb7="";
set(handles.edit1,'String','')
temp = 0;
%%
% Determine the number of classes from the training data.
data = imageDatastore('Data',...
    'IncludeSubfolders',true,...
    'LabelSource','foldernames');

dataTrain = shuffle(data);

numClasses = numel(categories(dataTrain.Labels));

if NG == 0 
    set(handles.text4,'String','Loading Existing Neural Network Data...')
    pause(0.2)
    disp("Loading Existing Neural Network Data...")
    load('GUI','netTransfer')
    set(handles.uipanel6,'Visible','off')
end


if (NG > 0)
set(handles.text4,'String','Training Neural Network...')
pause(0.2)
% Load a pretrained AlexNet network.
net = alexnet;

%%
% The last three layers of the pretrained network |net| are configured for
% 1000 classes. These three layers must be fine-tuned for the new
% classification problem. Extract all the layers except the last three from
% the pretrained network, |net|.

    layersTransfer = net.Layers(1:end-3);

%%
% Transfer the layers to the new task by replacing the last three layers
% with a fully connected layer, a softmax layer, and a classification
% output layer. Specify the options of the new fully connected layer
% according to the new data. Set the fully connected layer to be of the
% same size as the number of classes in the new data. To speed up training,
% also increase |'WeightLearnRateFactor'| and |'BiasLearnRateFactor'|
% values in the fully connected layer.

%%
% Create the layer array by combining the transferred layers with the new
% layers.
    layers = [...
        layersTransfer
        fullyConnectedLayer(numClasses,'WeightLearnRateFactor',20,'BiasLearnRateFactor',20)
        softmaxLayer
        classificationLayer];

%%
% If the training images differ in size from the image input layer, then
% you must resize or crop the image data. The images in |merchImages| are
% the same size as the input size of AlexNet, so you do not need to resize
% or crop the new image data.

%%
% Create the training options. For transfer learning, you want to keep the
% features from the early layers of the pretrained network (the transferred
% layer weights). Set |'InitialLearnRate'| to a low value. This low initial
% learn rate slows down learning on the transferred layers. In the previous
% step, you set the learn rate factors for the fully connected layer higher
% to speed up learning on the new final layers. This combination results in
% fast learning only on the new layers, while keeping the other layers
% fixed. When performing transfer learning, you do not need to train for as
% many epochs. To speed up training, you can reduce the value of the
% |'MaxEpochs'| name-value pair argument in the call to |trainingOptions|.
% To reduce memory usage, reduce |'MiniBatchSize'|.

    options = trainingOptions('sgdm',...
        'MiniBatchSize',15,...  %This is used to test accuracy of images. The number declared here will determine number of images tested against the network
        'MaxEpochs',5,... %Determines number of iterations that will be performed
        'InitialLearnRate',0.0001,... %Sets learning speed of new layers
        'Plots','training-progress'); 
        
    netTransfer = trainNetwork(dataTrain,layers,options);

    set(handles.text4,'String','Neural Network Trained. Exporting Data...')
    pause(0.2)
    save('GUI','netTransfer')
    set(handles.uipanel6,'Visible','off')
end

stage=2;
inputSize = netTransfer.Layers(1).InputSize(1:2);
confirmthresh=10;
prevlabel='NULL';
confirm=0;
 
close(figure(2))

while(1)
    vecphoto=fread(tcp,[227 227],'uint8');  %% Receives vectorized image from server
    cam_snap=reshape(vecphoto,227,227);  %% Reshapes vector into an array 
    cam_snap=uint8(cam_snap);  %% Changes type of array from double to uint8
    
    %%%%%
    
    
    
    %%%%%%
    try BW = image_Binarize(cam_snap);
    catch BW=image_Binarize(cam_snap_prev);
    end
    
    
    BW_Train=BW*255;
    BW_Train=uint8(BW_Train);
    BW_Train = cat(3, BW_Train, BW_Train, BW_Train);
    cam_snap = cat(3, cam_snap, cam_snap, cam_snap);
    [centroids, row1L, row2L, column1L, column2L, wL, hL] = draw_Rectangle(BW);

    sfigure(1);      imshow(BW); 
    hold on;
    rectangle('Position',[column1L row1L wL hL],'EdgeColor','r','LineStyle','-.','LineWidth',1.5);
    plot(centroids(:,1), centroids(:,2), '+r', 'MarkerSize',10);           %%%Mass Centroid
    hold off;
    
%     h = sfigure(2);
    picture = BW_Train;
    picture = uint8(picture);
    [label, score] = classify(netTransfer, picture);
    
%     ax1 = subplot(1,2,1);
%     ax2 = subplot(1,2,2);
%     ax2.ActivePositionProperty = 'position'
    
%     if (temp < 1)
%         %               h = figure(4);
%         h.Position(3) =   2*h.Position(3);
%         temp = temp + 1;
%     end
    
    % Select the top five predictions
    [~,idx] = sort(score,'descend');
    idx = idx(5:-1:1);
    scoreTop = score(idx);
    classNames = netTransfer.Layers(end).ClassNames;
    classNamesTop = classNames(idx);
    % Plot the histogram
%     barh(ax2,scoreTop)
%     title(ax2,'Top 5')
%     xlabel(ax2,'Probability')
%     xlim(ax2,[0 1])
%     yticklabels(ax2,classNamesTop)
%     ax2.YAxisLocation = 'right';
%     
%     drawnow
    
    
    if strcmp(char(label),char(prevlabel))
      confirm=confirm+1;
      
      if (confirm < confirmthresh) && (max(score)>0.8)
          axes(handles.axes1)
          %imshow(cam_snap);
          imshow(BW)
          percent=confirm/confirmthresh*100;
          title(sprintf('Confirming: %s%%',int2str(percent)));
          drawnow;
      end
      
      if (confirm>=confirmthresh) && (max(score)>0.8)
          axes(handles.axes1)
          %imshow(cam_snap);
          imshow(BW)
          title({char(label),num2str(max(score),2)});
          drawnow;
          commands=Gesture2Command(label,commands);
          

          
%               if strcmp(char(label),'Red Light Trigger')
%                   set_Lamp_RGB(Light3, [255,0,0]);  %Set Hue Light Color
%               end

      end
      
    else
        axes(handles.axes1)
        imshow(cam_snap)
        imshow(BW);
        drawnow;
        confirm=0;
        commands=zeros(1,commandlength);
    end

    prevlabel=label;
    center_image = size(cam_snap)/2+.5;                                     %%%Calculates Center point
    cam_sensitivity = 70; 
    center_sensitivity = 30;
    
   if centroids(:,1) > center_image(:,2)+center_sensitivity                  %%%Will center the user to the middle of the screen
       commands(1) = 1;
       commands(2) = 0;
       if centroids(:,1) > center_image(:,2)+cam_sensitivity                   %%%Will center the user to the middle of the screen
       commands(3) = 1;
       commands(4) = 0;
       end
   elseif centroids(:,1) < center_image(:,2)-center_sensitivity
       commands(2) = 1;
       commands(1) = 0;
       if centroids(:,1) < center_image(:,2)-cam_sensitivity
       commands(4) = 1;
       commands(3) = 0;
       end
    else
       commands(1) = 0;
       commands(2) = 0;
       commands(3) = 0;
       commands(4) = 0;
    end
    
   fwrite(tcp,commands);
   
   move = num2str(commands(5:commandlength));
   
%    switch move
%        case '0  0  0  1  0'
%              set_Lamp_RGB(Light2, [255,0,0]);
%        case '0  0  0  0  1'
%              set_Lamp_RGB(Light2, [0,255,0]);
%        otherwise 
%              set_Lamp_RGB(Light2, [0,0,0]);
%    end
   
%    pop3value=get(handles.popupmenu3,'Value');
% image1=imread(char(strcat(newfiles(pop3value),'\image_10.jpg')));
% image2=imread(char(strcat(char(filename),char(strcat('\','Both Hands')),char('\image_10.jpg'))));


% imshow(cam_snap)
axes(handles.axes2)
barh(scoreTop);
title('Top 5')
xlabel('Probability')
xlim([0 1])
yticklabels(classNamesTop)
drawnow();

cam_snap_prev=cam_snap;
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
global pb7
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pb7=get(handles.edit1,'String');
