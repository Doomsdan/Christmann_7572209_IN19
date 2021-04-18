function [xZero,abortflag, iters, h] = myNewton(varargin)
%%do the vcarargin
for i = 1:nargin
    if strcmp(varargin{i},'Function')
        func = varargin{i+1};
    elseif strcmp(varargin{i},'Derivative')
        dfunc = varargin{i+1};
    elseif strcmp(varargin{i},'StartValue')
        x0 = varargin{i+1};
    elseif strcmp(varargin{i},'MaxIter')
        maxIter = varargin{i+1};
    elseif strcmp(varargin{i},'Feps')
        feps = varargin{i+1};
    elseif strcmp(varargin{i},'Xeps')
        xeps = varargin{i+1};
    elseif strcmp(varargin{i},'LivePlot')
        livePlot = varargin{i+1};
    end
end




%% check for neccecssary parameters
if ~exist('func','var')
    error('No valid function');
end

    
if ~exist('dfunc','var')
     answer = questdlg('Wie wollen sie differenzieren',...
         'Differenz Typen',...
         'Vorwärtsdifferenzieren','Rückwärtsdifferenzieren',...
         'Zentraldifferenzieren','Zentraldifferenzieren');
end

if ~exist('x0','var')
    x0 = 0;
    disp(['Using default startvalue: x0 = ',num2str(x0)]);  
end

if ~exist('maxIter','var')
    maxIter = 50;
    disp(['Using default MaxIter: maxIter = ',num2str(maxIter)]);  
end

if ~exist('xeps','var')
    xeps = 1e-6;
    disp(['Using default Xeps: xeps = ',num2str(xeps)]);  
end

if ~exist('feps','var')
    feps = 1e-6;
    disp(['Using default Feps: feps = ',num2str(feps)]);  
end

if ~exist('livePlot','var')
    livePlot = 'off';
    disp(['Using default Feps: feps = ',num2str(feps)]);  
end





%% start of algorithm
if strcmp(livePlot,'on')
    h = figure('name','Newton Visualisierung');
    ax1 = subplot(2,1,1);
    plot(ax1,0 ,x0 ,'bo');
    ylabel('xvalue');
    hold on;
    grid on;
    xlim('auto');
    ax2 = subplot(2,1,2);
    semilogy(ax2,0,x0,'rx');
    ylabel('Function Value');
    hold on;
    grid on;
    xlim('auto');
    ylim('auto');
end


xOld = x0;
abortflag = 'maxIter';
for i=1:maxIter
    f = func(xOld);
    if f  < feps
        abortflag = 'feps';
        break;
    end
    if ~exist('dfunc','var')
        df = numDiff(func,xOld,answer);
    else
        df = dfunc(xOld);
    end
   
    if df == 0
        abortflag = 'df is 0';
        break;
    end
    xNew = xOld - f/df;
    if abs(xNew-xOld) < xeps
        abortflag = 'xeps';
        break;
    end
    xOld = xNew;
    if strcmp(livePlot,'on')
       plot(ax1,i,xNew,'bo');
       semilogy(ax2,i,func(xNew),'rx');
       pause(0.1);
        
    end
end
xZero = xNew;
iters = i;
disp(['Abort reason: ',abortflag]);
end
