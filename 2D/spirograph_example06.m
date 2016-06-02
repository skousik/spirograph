figure(1)
set(gca,'Color',[0 0 0]);
hold on

axis equal

for W = 1:3:75
cap = 75 ;
T = 2*pi ;
N = 3000 ; % granularity
l = [sind(W) cosd(W)/10] ;
w = [1 mod(W,cap)];
f = zeros(1,length(l)) ;

p = spirograph(l,w,f,T,N) ;

[r,~] = size(p) ;

c = [140.*abs(sin(W)) 140.*abs(sin(W+2*pi/3)) 140.*abs(sin(W+4*pi/3))]./141 ;

for idx = 1:2:r
    plot(p(idx,:),p(idx+1,:),'Color',c)
    pause(0.03) ;
end
end