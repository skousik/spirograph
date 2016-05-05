function w = qrot(q,v)
% rotate vector(s) v (3xn) according to quaternion(s) q (4xn)
    [~,n] = size(q) ;
    
    w = zeros(3,n) ;
    
    for idx = 1:n
        qq = q(:,idx) ;
        q0 = qq(1) ;
        q1 = qq(2) ;
        q2 = qq(3) ;
        q3 = qq(4) ;
        
        % rotation matrix
        M = [(1-2*q2^2-2*q3^2), 2*(q1*q2 + q0*q3), 2*(q1*q3 - q0*q2) ;
             2*(q1*q2 - q0*q3), (1-2*q1^2-2*q3^2), 2*(q2*q3 + q0*q1) ;
             2*(q1*q3 + q0*q2), 2*(q2*q3 - q0*q1), (1-2*q1^2-2*q2^2)] ;
        
        % rotate vector
        w(:,idx) = M*v(:,idx) ;
    end
end