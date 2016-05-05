% TO DO %
% rotate the successor w vector to be fixed in the coordinate frame of the
% predecessor link, instead of being an inertial frame vector

clear
clc

% make the links 3D!
l = [5 1 1 1 1 1 1 1 1 1;
     0 0 0 0 0 0 0 0 0 0;
     0 1 2 3 4 5 6 7 8 9] ;

w = [0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0;
     1 1 1 1 1 1 1 1 1 1] ;

T = 2*pi ;
N = 1000 ;

% w must be a 3xn array of angular velocities
[~,n] = size(l) ; % number of links
f = zeros(n,1) ;
t = linspace(0,T,N) ; % angle vector
p = zeros(3*n,N) ; % x,y,z positions of ends of links

count = 1 ;
widx = w(:,count) ; % angular velocity vector of first link
o = norm(widx) ; % angular velocity magnitude of first link
widx = widx./o ; % normalize rotation vector

% rotation quaternions of first link
qidx = [cos(o*t./2) ;
        widx(1)*sin(o*t./2) ;
        widx(2)*sin(o*t./2) ;
        widx(3)*sin(o*t./2)] ;

% position of first link
p(1:3,:) = qrot(qidx,repmat(l(:,1),1,N)) ;

plot3(p(1,:),p(2,:),p(3,:))
hold on

count = 2 ;
for idx1 = 4:3:3*n
    widx = w(:,count) ; % initial angular velocity vector of link
    o = norm(widx) ; % angular velocity magnitude of link
    widx = widx./o ; % normalize rotation vector

    % rotation quaternions of each link
    qidx = [cos(o*t./2) ;
            widx(1)*sin(o*t./2) ;
            widx(2)*sin(o*t./2) ;
            widx(3)*sin(o*t./2)] ;
    p(idx1:idx1+2,:) = p(idx1-3:idx1-1,:) + qrot(qidx,repmat(l(:,count),1,N)) ;
    plot3(p(idx1,:),p(idx1+1,:),p(idx1+2,:))


    count = count + 1 ;
end

plot3(0,0,0,'rx')

% % plot initial link position
% linkcolor = [0.2 0.2 0.2] ;
% plot3([0,l(1,1)],[0,l(2,1)],[0,l(3,1)],'Color',linkcolor)
% for idx2 = 2:n
% 	plot3([l(1,idx2-1),l(1,idx2)+l(1,idx2-1)],...
%           [l(2,idx2-1),l(2,idx2)+l(2,idx2-1)],...
%           [l(3,idx2-1),l(3,idx2)+l(3,idx2-1)],...
%           'Color',linkcolor)
% end

axis equal