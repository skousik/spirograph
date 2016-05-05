function p = spirograph3D(l,w,f,T,N)
% w must be a 3xn array of angular velocities
    n = length(l) ; % number of links
    t = linspace(0,T,N) ; % angle vector
    p = zeros(3*n,N) ; % x,y,z positions of ends of links
    
    count = 1 ;
    widx = w(:,count) ; % angular velocity vector of first link
    o = norm(widx) ; % angular velocity magnitude of first link
    widx = widx./o ; % normalize rotation vector
    
 % rotation quaternion of first link
    qidx = [cos(t./2) ;
            widx(1)*sin(t./2) ;
            widx(2)*sin(t./2) ;
            widx(3)*sin(t./2)]' ;
    
 % position of first link, duplicated n times
    p(1:3,:) = repmat([l; 0; 0],1,n) ;
    
	count = 2 ;
    for idx = 4:3:3*n
        widx = w(:,count) ; % angular velocity vector of each link
        o = norm(widx) ; % angular velocity magnitude of each link
        p(idx,:) = [p(idx-2,:) + l((idx+1)/2)*cos(w((idx+1)/2)*t + f((idx+1)/2))];
        p(idx+1,:) = [p(idx-1,:) + l((idx+1)/2)*sin(w((idx+1)/2)*t + f((idx+1)/2))];
        
        count = count + 1 ;
    end
end