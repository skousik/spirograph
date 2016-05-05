function varargout = spirographApp(varargin)
% SPIROGRAPHAPP MATLAB code for spirographApp.fig
%      SPIROGRAPHAPP, by itself, creates a new SPIROGRAPHAPP or raises the existing
%      singleton*.
%
%      H = SPIROGRAPHAPP returns the handle to a new SPIROGRAPHAPP or the handle to
%      the existing singleton*.
%
%      SPIROGRAPHAPP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPIROGRAPHAPP.M with the given input arguments.
%
%      SPIROGRAPHAPP('Property','Value',...) creates a new SPIROGRAPHAPP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before spirographApp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to spirographApp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help spirographApp

% Last Modified by GUIDE v2.5 05-May-2016 01:14:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @spirographApp_OpeningFcn, ...
                   'gui_OutputFcn',  @spirographApp_OutputFcn, ...
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


% --- Executes just before spirographApp is made visible.
function spirographApp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to spirographApp (see VARARGIN)

% setup spirograph data default
handles.l = [1 0.8] ; % link lengths
handles.w = [1 -1] ; % angular velocities
handles.f = zeros(length(handles.l)) ;
handles.T = 2*pi ; % distance of revolution in radians
handles.N = 250 ; % number of data points to simulate
handles.p = spirograph(handles.l,handles.w,handles.f,handles.T,handles.N) ;
handles.axisSize = 1.2*sum(abs(handles.l)) ;

% setup axes
set(gca,'Color',[0 0 0]);
axis(handles.axisSize.*[-1 1 -1 1]) ;

handles.showLinks = false ;

% Choose default command line output for spirographApp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes spirographApp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = spirographApp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editLink_Callback(hObject, eventdata, handles)
% hObject    handle to editLink (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editLink as text
%        str2double(get(hObject,'String')) returns contents of editLink as a double
l = str2num(get(hObject,'String')) ;
w = handles.w ;

nl = length(l) ;
nw = length(w) ;

if nw < nl
    w = [w zeros(1,nl-nw)] ;
elseif nw > nl
    w = w(1:nl) ;
end
handles.l = l ;
handles.w = w ;
set(handles.editVels,'String',num2str(w))
set(hObject,'String',num2str(l))

% set phase information to zero
handles.f = zeros(nl) ;

% reset axes
handles.axisSize = 1.2*sum(abs(l)) ;

guidata(hObject,handles) ;


% --- Executes during object creation, after setting all properties.
function editLink_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editLink (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editVels_Callback(hObject, eventdata, handles)
% hObject    handle to editVels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editVels as text
%        str2double(get(hObject,'String')) returns contents of editVels as a double
w = str2num(get(hObject,'String')) ;
l = handles.l ;

nl = length(l) ;
nw = length(w) ;

if nw < nl
    l = l(1:nw) ;
elseif nw > nl
    l = [l zeros(1,nw-nl)] ;
end
handles.l = l ;
handles.w = w ;

set(handles.editLink,'String',num2str(l))
set(hObject,'String',num2str(w))

% set phase information to zero
handles.f = zeros(nl) ;

% reset axes
handles.axisSize = 1.2*sum(abs(l)) ;

guidata(hObject,handles) ;


% --- Executes during object creation, after setting all properties.
function editVels_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editVels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function editReso_Callback(hObject, eventdata, handles)
% hObject    handle to editReso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
N = floor(500*get(hObject,'Value')) + 1 ;
handles.N = N ;
guidata(hObject,handles) ;


% --- Executes during object creation, after setting all properties.
function editReso_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editReso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in showLinks.
function showLinks_Callback(hObject, eventdata, handles)
% hObject    handle to showLinks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of showLinks
handles.showLinks = get(hObject,'Value') ;
guidata(hObject,handles) ;

% --- Executes on button press in animate.
function animate_Callback(hObject, eventdata, handles)
% hObject    handle to animate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% get latest data
l = handles.l ;
w = handles.w ;
f = handles.f ;
T = handles.T ;
N = handles.N ;
p = spirograph(l,w,f,T,N) ;
handles.p = p ;

n = length(l) ;

% color setup
leg_color = [0.3 0.3 0.3] ;
linewidth = 1.5 ;

pauseLength = (-0.05/499)*(N-1) + 0.055 ;

for idx1 = 1:N
% setup plot area
    hold on
    set(gca,'Color',[0 0 0]);
    axis(handles.axisSize.*[-1 1 -1 1]) ;
    
% plot links
    if handles.showLinks
        % plot first link
        plot([0,p(1,idx1)],[0,p(2,idx1)],'Color',leg_color,'LineWidth',linewidth)
        % plot subsequent links
        for idx2 = 3:2:2*n
            plot([p(idx2-2,idx1),p(idx2,idx1)], ...
                 [p(idx2-1,idx1),p(idx2+1,idx1)], ...
                 'Color', leg_color,'LineWidth',linewidth)
        end
    end

% plot end curve
    plot(p(end-1,1:idx1),p(end,1:idx1),'w','LineWidth',linewidth)
    
    pause(pauseLength) ;
    
% clear plot after each time step
    if idx1 < N
        cla
    end
end

function p = spirograph(l,w,f,T,N)
    n = length(l) ; % number of links
    t = linspace(0,T,N) ;
    p = zeros(2*n,N) ; % positions of ends of links

    p(1:2,:) = [l(1)*cos(w(1)*t + f(1));
                l(1)*sin(w(1)*t + f(1))]; % circle drawn by end of first link
    for idx = 3:2:2*n
        p(idx,:) = [p(idx-2,:) + l((idx+1)/2)*cos(w((idx+1)/2)*t + f((idx+1)/2))];
        p(idx+1,:) = [p(idx-1,:) + l((idx+1)/2)*sin(w((idx+1)/2)*t + f((idx+1)/2))];
    end
