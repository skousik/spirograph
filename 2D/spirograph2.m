function p = spirograph2(l,w,T,N)
t = linspace(0,T,N) ;
[nl,kl] = size(l) ;
[nw,kw] = size(w) ;

if nl ~= nw
    error('Must have the same number of legs and angular velocities!')
end

if kl == 1
    l = repmat(l,1,N) ;
end
if kw == 1
    w = repmat(w,1,N) ;
end

p = zeros(2*nl,N) ; % array to fill with positions of ends of links

p(1:2,:) = [l(1,:).*cos(w(1,:).*t);
            l(1,:).*sin(w(1,:).*t)]; % shape drawn by end of first link
for idx = 3:2:2*nl
    p(idx,:) = p(idx-2,:) + l((idx+1)/2,:).*cos(w((idx+1)/2,:).*t);
    p(idx+1,:) = p(idx-1,:) + l((idx+1)/2,:).*sin(w((idx+1)/2,:).*t);
end
end