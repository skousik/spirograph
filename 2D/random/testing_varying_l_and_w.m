T = 2*pi ;
N = 200 ;
t = linspace(0,T,N) ;

lmax = [5 3 1]' ;
wmax = [1 -2 7]' ;

l = repmat(lmax,1,N).*[sin(t); cos(t); sin(t+pi)] ;

p = spirograph2(l,wmax,T,N) ;

% figure setup
h = figure(1) ;
plot_size = 1.2*sum(lmax) ;
hold on
set(gca,'Color',[0 0 0]);
set(h,'Position',[500 250 600 600])
% axis equal
axis(plot_size.*[-1 1 -1 1]) ;

% color setup
leg_color = [0.3 0.3 0.3] ;
linewidth = 1.5 ;

% plotting
n = length(lmax) ;
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
    
    pause(0.03) ;
    
    if idx1 < N
        clf
    end
end