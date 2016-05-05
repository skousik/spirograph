% TO DO %
% rotate the successor w vector to be fixed in the coordinate frame of the
% predecessor link, instead of being an absolute vector as it is right now

clear
clc

l = [7 5 3 1] ;

w = [0 1 0 14;
     0 0 0 0;
     1 0 5 0] ;
 
f = [0 0 0] ;
T = 4*pi ;
N = 1000 ;

% w must be a 3xn array of angular velocities
n = length(l) ; % number of links
t = linspace(0,T,N) ; % angle vector
p = zeros(3*n,N) ; % x,y,z positions of ends of links

count = 1 ;
widx = w(:,count) ; % angular velocity vector of first link
o = norm(widx) ; % angular velocity magnitude of first link
widx = widx./o ; % normalize rotation vector

% rotation quaternion matrix of first link
qidx = [cos(t./2) ;
        widx(1)*sin(o*t./2) ;
        widx(2)*sin(o*t./2) ;
        widx(3)*sin(o*t./2)] ;

% position of first link
p(1:3,:) = qrot(qidx,repmat([l(1); 0; 0],1,N)) ;

plot3(p(1,:),p(2,:),p(3,:))
hold on

count = 2 ;
for idx = 4:3:3*n
    widx = w(:,count) ; % angular velocity vector of each link
    o = norm(widx) ; % angular velocity magnitude of each link
    widx = widx./o ; % normalize rotation vector

    % rotation quaternion matrix of first link
    qidx = [cos(o*t./2) ;
            widx(1)*sin(o*t./2) ;
            widx(2)*sin(o*t./2) ;
            widx(3)*sin(o*t./2)] ;
    p(idx:idx+2,:) = p(idx-3:idx-1,:) + qrot(qidx,repmat([l(count); 0; 0],1,N)) ;
    plot3(p(idx,:),p(idx+1,:),p(idx+2,:))


    count = count + 1 ;
end

plot3(0,0,0,'rx')

axis equal