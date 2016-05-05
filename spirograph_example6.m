% generate paths
T = 2*pi ;
N = 100 ;
l = [5 3 1] ;
w = [1 -2 4] ;
f = zeros(1,length(l)) ;
p = spirograph(l,w,f,T,N) ;

% figure setup
h = figure(1) ;
plot_size = 10 ;
hold on
set(gca,'Color',[0 0 0]);
set(h,'Position',[500 250 600 600])
% axis equal
axis(plot_size.*[-1 1 -1 1]) ;

% color setup
leg_color = [0.3 0.3 0.3] ;
linewidth = 1.5 ;

% plotting
n = length(l) ;
for idx1 = 1:N
    
    figure(1)
    hold on
    set(gca,'Color',[0 0 0]);
    % % axis equal
    axis(plot_size.*[-1 1 -1 1]) ;
    
    plot([0,p(1,idx1)],[0,p(2,idx1)],'Color',leg_color,'LineWidth',linewidth)
    for idx2 = 3:2:2*n
        % plot links
        plot([p(idx2-2,idx1),p(idx2,idx1)], ...
             [p(idx2-1,idx1),p(idx2+1,idx1)], ...
             'Color', leg_color,'LineWidth',linewidth)
    end

    % plot end curve
    plot(p(end-1,1:idx1),p(end,1:idx1),'w','LineWidth',linewidth)
    
    M(idx1) = getframe ;
    
    if idx1 < N
        clf
    end
end