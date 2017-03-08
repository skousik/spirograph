clear
clc

% generate paths
T = 2*pi ;
N = 500 ;
l = [10 8 6] ;
w = [1 -11 21] ;
f = zeros(1,length(l)) ;
p = spirograph(l,w,f,T,N) ;
[r,~] = size(p) ;

% figure setup
h = figure(1) ;
plot_size = sum(abs(l))*1.1 ;
hold on
set(gca,'Color',[0 0 0]);
set(h,'Position',[500 250 600 600])
% axis equal
axis(plot_size.*[-1 1 -1 1]) ;


% plotting
n = length(l) ;
l_plot = [n-1 n] ; % link indices for which to plot joint trajectory
leg_color = [0.6 0.5 0.4] ;
linewidth = 1 ;
slow_cnst = 13 ;

for idx1 = 1:N
    % color for current plot
    c = [1+sin(idx1/slow_cnst + 0*pi/1), ...
         1+sin(idx1/slow_cnst + 5*pi/6),...
         1+sin(idx1/slow_cnst + 6*pi/7)]./2 ;
    
%     c = [1 1 1] ;
    
    figure(1)
    hold on
    set(gca,'Color',[0 0 0]);
    % % axis equal
    axis(plot_size.*[-1 1 -1 1]) ;
    
    % plot links
    if idx1 < N
        plot([0,p(1,idx1)],[0,p(2,idx1)],'Color',leg_color,'LineWidth',linewidth)
        for idx2 = 3:2:2*n
                plot([p(idx2-2,idx1),p(idx2,idx1)], ...
                     [p(idx2-1,idx1),p(idx2+1,idx1)], ...
                     'Color', leg_color, 'LineWidth',linewidth)
        end
    end

    % plot end curve
    for idx3 = l_plot
        plot(p(2*idx3-1,1:idx1),p(2*idx3,1:idx1),'Color',c,'LineWidth',linewidth)
    end
    
    pause(0.01) ;
    
    if idx1 < N
        clf
    end
end