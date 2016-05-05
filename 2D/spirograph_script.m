% spirograph
% function spirograph(l,w,f,T)
% if nargin < 4
%     T = 2*pi ;
% end

% for ZORP = 1:1
figure(1)
set(gca,'Color',[0 0 0]);
hold on
% % R = sum(abs(l1)+abs(l2)) ;
% % axis([-R R -R R])
axis equal
for W = 1:3:75
cap = 13 ;
T = 2*pi ;
N = 3000 ; % granularity
l1 = [sind(W) cosd(W)/10] ;%10.*rand(3,1) ; %[5 2 1] ; % lengths of links
% l2 = 7.*rand(3,1) ; %[8 2 1] ; % lengths of links
% l3 = [13 2 1] ; % lengths of links
w = [1 mod(W,200)]; %[2 -8 103] ; % angular velocities of links
f = zeros(1,length(l1)) ;


% figure(1)
% hold on
% set(gca,'Color',[0 0 0]);
% % R = sum(abs(l1)+abs(l2)) ;
% % axis([-R R -R R])
% axis equal

p = [spirograph(l1,w,f,T,N)] ;
%      spirograph(l2,w,f,T,N)] ;
%      spirograph(l3,w,f,T,N)] ;

[r,~] = size(p) ;
 
% c = [140.*abs(sin(W)) 140.*abs(sin(W + 2*pi/3)) 140.*abs(sin(W + 4*pi/3))]./141 ;
c = [140.*abs(sin(W)) 140.*abs(sin(W+2*pi/3)) 140.*abs(sin(W+4*pi/3))]./141 ;

for idx = 1:2:r % 3:2:r
    plot(p(idx,:),p(idx+1,:),'Color',c)
    getframe ;
end
end

%     plot(p(idx,1),p(idx+1,1),'o')
% axis equal
% plot(p(1,:),p(2,:))
% plot(p(1,1),p(2,1),'o')
%%
colorMat = autumn ;
colorMat = [colorMat; colorMat(end:-1:1,:)];

% for idx2 = 1:length(p)-1
%     for idx = 3:2:r
%         plot(p(idx,idx2:idx2+1),p(idx+1,idx2:idx2+1),...
%              'Color',colorMat(mod(idx2,128)+1,:))
%     end
%     M(idx2) = getframe ;
% end
% plot(0,0,'rx')
% grid on
% end
% end