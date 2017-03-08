function p = spirograph(l,w,f,T,N)
    n = length(l) ; % number of links
    t = linspace(0,T,N) ;
    p = zeros(2*n,N) ; % positions of ends of links

    p(1:2,:) = [l(1)*cos(w(1)*t + f(1));
                l(1)*sin(w(1)*t + f(1))]; % circle drawn by end of first link
    for idx = 3:2:2*n
        p(idx,:) = [p(idx-2,:) + l((idx+1)/2)*cos(w((idx+1)/2)*t + f((idx+1)/2))];
        p(idx+1,:) = [p(idx-1,:) + l((idx+1)/2)*sin(w((idx+1)/2)*t + f((idx+1)/2))];
    end
end