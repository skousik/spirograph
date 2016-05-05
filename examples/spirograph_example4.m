h = figure(1) ;
hold on
set(gca,'Color',[0 0 0]);
set(h,'Position',[500 250 600 600])
axis equal
axis(1.5.*[-1 1 -1 1])

for W = 1:3:500
cap = mod(W,3) ;
T = 2*pi ;
N = 3000 ;
l = [abs(sind(W)) cosd(W)] ;
w = [1 mod(cap,W)+1];
f = zeros(1,length(l)) ;

p = spirograph(l,w,f,T,N) ;

[r,~] = size(p) ;

c = [140.*abs(sin(W)) 140.*abs(sin(W+2*pi/3)) 140.*abs(sin(W+4*pi/3))]./141 ;

for idx = 1:2:r
    plot(p(idx,:),p(idx+1,:),'Color',c)
end
    getframe ;
end