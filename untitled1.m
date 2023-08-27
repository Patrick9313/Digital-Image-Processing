function varargout = untitled1(varargin)
% UNTITLED1 MATLAB code for untitled1.fig
%      UNTITLED1, by itself, creates a new UNTITLED1 or raises the existing
%      singleton*.
%
%      H = UNTITLED1 returns the handle to a new UNTITLED1 or the handle to
%      the existing singleton*.
%
%      UNTITLED1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED1.M with the given input arguments.
%
%      UNTITLED1('Property','Value',...) creates a new UNTITLED1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled1

% Last Modified by GUIDE v2.5 11-May-2022 11:43:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled1_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
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


% --- Executes just before untitled1 is made visible.
function untitled1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled1 (see VARARGIN)

% Choose default command line output for untitled1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

if strcmp(get(hObject,'Visible'),'off')
%   plot(rand(5));
end
global h1 h2 h3 h4 h5 h6 h7 h8
h1=handles.axes1;
h2=handles.axes2;
h3=handles.axes3;
h4=handles.axes4;
h5=handles.axes5;
h6=handles.axes6;
h7=handles.axes7;
h8=handles.axes8;

%-----------------初始化界面属性
% set(handles.edit1,'string','1');
% set(handles.edit2,'string','2');
% set(handles.edit3,'string','125');
% set(handles.pushbutton2,'Visible','off');

set(h1,'Visible','off');
set(h2,'Visible','off');
set(h3,'Visible','off');
set(h4,'Visible','off');
set(h5,'Visible','off');
set(h6,'Visible','off');
set(h7,'Visible','off');
set(h8,'Visible','off');

set(handles.edit1,'string','0');
set(handles.edit2,'string','0');


% UIWAIT makes untitled1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
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
%global h1
G=imread('LENA256.BMP');
Key=KeyGen(G);
%set(gcf,'CurrentAxes',h1);
axes(handles.axes1);
imshow(Key/256);
title('密钥');
save key1.mat Key;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global h2
axes(handles.axes2);
G=imread('LENA256.BMP');
%set(gcf,'CurrentAxes',h2);
imshow(G);
title('原图像');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global h4
G=imread('LENA256.BMP');
load('key1.mat');
Cypher=OTPEncryption(Key,G);
%set(gcf,'CurrentAxes',h4);
axes(handles.axes3);
imshow(Cypher/256);
title('加密图像');
save Cypher1.mat Cypher;


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('Cypher1.mat');
Cypherflow=PSconversion(Cypher);
NoisePower = str2num(get(handles.edit1, 'string'));
Cypherflow1=transmission(Cypherflow,NoisePower);
CypherRec=SPconversion(Cypherflow1);

axes(handles.axes4);
imshow(CypherRec/256);
title('接收密文');
save CypherRec1.mat CypherRec;


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('CypherRec1.mat');
load('key1.mat');
pic2=OTPDecryption(Key,CypherRec);
axes(handles.axes5);
imshow(pic2/256);
title('解密图像');


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
G=imread('LENA256.BMP');
load('Cypher1.mat');
load('CypherRec1.mat');
load('key1.mat');
axes(handles.axes6);
histogram(G);
title('图像统计');
axes(handles.axes7);
histogram(Key);
title('密钥统计');
axes(handles.axes8);
histogram(CypherRec);
title('密文统计');
AA=Analyze(Cypher,CypherRec);

set(handles.edit2,'string',num2str(AA*100));




% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%%%%%%%%%%%%%%%%%%%十进制整数转换为二进制矩阵%%%%%%%%%%%%%%%%%%%%%%
function r=dectobin(t)
r=zeros(1,8);
for i=1:8
   r(9-i)=mod(t,2);
   t=fix(t/2);
end


%%%%%%%%%%%%%%%%%%%%%二进制转换为十进制矩阵%%%%%%%%%%%%%%%%%%%%%%
function r=bintodec(t)
for k=1:7
    t(k)=t(k)*2^(8-k);
end
r=sum(t);



%%%%%%%%%%%%%%%%%%%%%%%%密钥生成程序%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Key=KeyGen(pic)
row=size(pic,1);
col=size(pic,2);
Key=zeros(row,col);

for i=1:row
    for j=1:col
        Key(i,j)=floor(rand(1)*256);
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%密钥加密程序%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Cypher=OTPEncryption(Key,pic)
pic=double(pic);
Key=double(Key);
Cypher=bitxor(Key,pic);




%%%%%%%%%%%%%%%%%%%%%%%%数据并串转换%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Cypherflow=PSconversion(Cypher)
row=size(Cypher,1);
col=size(Cypher,2);
temp=cell(row,col);

for i=1:row
    for j=1:col
        
        AA=dectobin(Cypher(i,j));
        temp{i,j}=AA;
    end
end
Cypherflow=temp;


%%%%%%%%%%%%%%%%%%%%%%%%数据传输%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function CypherflowReceive=transmission(CypherflowSend,NoisePower)

row=size(CypherflowSend,1);
col=size(CypherflowSend,2);
CypherflowSig=cell(row,col);
CypherflowSigNoise=cell(row,col);
CypherflowSigRec=cell(row,col);


%%%电平转换完成2ASK的编码
for i=1:row
    for j=1:col      
          temp01=CypherflowSend{i,j};
          tempSig=zeros(1,8);
       for k=1:8
           if(temp01(k)==1)
               tempSig(k)=1;
           else
               tempSig(k)=-1;
           end
       end
        CypherflowSig{i,j}=tempSig;
        
    end
end

% CypherflowReceive=CypherflowSig;



%%%经过信道加入加性噪声
for i=1:row
    for j=1:col      
       CypherflowSigNoise{i,j}=CypherflowSig{i,j}+10^(NoisePower/10)*randn(1,8);        
    end
end

%%%电平判决将2ASK转换为01比特
for i=1:row
    for j=1:col        
          temp01=CypherflowSigNoise{i,j};
          tempSigReceive=zeros(1,8);
       for k=1:8
           if(temp01(k)>0)
               tempSigReceive(k)=1;
           else
              tempSigReceive(k)=0;
           end
       end
       
       CypherflowSigRec{i,j}=tempSigReceive;
        
         
    end
end

%%%%得到判决后的输出信号
CypherflowReceive= CypherflowSigRec;




%%%%%%%%%%%%%%%%%%%%%%%%数据并串转换%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Cypher=SPconversion(Cypherflow)
row=size(Cypherflow,1);
col=size(Cypherflow,2);
temp=zeros(row,col);

for i=1:row
    for j=1:col
        
        AA=bintodec(Cypherflow{i,j});
        temp(i,j)=AA;
    end
end
Cypher=temp;


%%%%%%%%%%%%%%%%%%%%%%%%密钥解密程序%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function pic=OTPDecryption(Key,Cypher)
pic=bitxor(Cypher,Key);




%%%%%%%%%%%%%%%%%%%%%%%%密钥分析程序%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ratioRight=Analyze(picAlice,picBob)


row=size(picAlice,1);
col=size(picAlice,2);
TotalNum=row*col;
temp=0;

for i=1:row
    for j=1:col
       if(picAlice(i,j)==picBob(i,j))
           temp=temp+1;
       end
    end
end

ratioRight=temp/TotalNum;



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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
