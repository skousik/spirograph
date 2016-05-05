h = figure(1) ;
hold on
set(gca,'Color',[0 0 0]);
set(h,'Position',[500 250 600 600])
axis equal
axis(1.5.*[-1 1 -1 1])

for W = 1:3:1000
cap = 7;% + round(cosd(W)) ;
T = 2*pi ;
N = 3000 ;
l = [abs(sind(W)) sind(W)] ;
w = [1 mod(cap,W)+1];
f = (1/4)*2*pi*ones(length(l),1) ;

p = spirograph(l,w,f,T,N) ;

[r,~] = size(p) ;

c = [abs(sin(W)) abs(sin(W+2*pi/3)) abs(sin(W+4*pi/3))]./1.01 ;

for idx = 1:2:r
    plot(p(idx,:),p(idx+1,:),'Color',c)
end
    getframe ;
end