function f = fibonacci(n,m)
% FIBONACCI Fibonacci sequence
% f = FIBONACCI(n) generates the first n Fibonacci numbers.
f = zeros(n,1);
f(1) = 1;

if n > 1
f(2) = 1;
if n > 2
for k = 3:n
f(k) = f(k-1) + f(k-2);
end

if nargin < 2
    m = 1 ;
end
f = f(m:end) ;
end
end

end