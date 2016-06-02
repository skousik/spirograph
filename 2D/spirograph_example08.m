figure(1)
hold on

for W = 1:3:500
cap = 4 ;
T = 2*pi ;
N = 3000 ;
l = [abs(sind(W)) cosd(W)] ;
w = [1 mod(cap,W)+1];
f = zeros(1,length(l)) ;

p = spirograph(l,w,f,T,N) ;

[r,~] = size(p) ;

c = [140.*abs(sin(W)) 140.*abs(sin(W+2*pi/3)) 140.*abs(sin(W+4*pi/3))]./141 ;

for idx = 1:2:r
    if mod(W,7) == 0
        clf
    end
    plot(p(idx,:),p(idx+1,:),'Color',c)
    set(gca,'Color',[0 0 0]);
    axis equal
end
    pause(0.03) ;
end