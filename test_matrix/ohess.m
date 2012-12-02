function H = ohess(x)
%OHESS  Random, orthogonal upper Hessenberg matrix.
%       H = OHESS(N) is an N-by-N real, random, orthogonal
%       upper Hessenberg matrix.
%       Alternatively, H = OHESS(X), where X is an arbitrary real
%       N-vector (N > 1) constructs H non-randomly using the elements
%       of X as parameters.
%       In both cases H is constructed via a product of N-1 Givens rotations.

%       Note: See Gragg (1986) for how to represent an N-by-N (complex)
%       unitary Hessenberg matrix with positive subdiagonal elements in terms
%       of 2N-1 real parameters (the Schur parametrization).
%       This M-file handles the real case only and is intended simply as a
%       convenient way to generate random or non-random orthogonal Hessenberg
%       matrices.
%
%       Reference:
%       W.B. Gragg, The QR algorithm for unitary Hessenberg matrices,
%       J. Comp. Appl. Math., 16 (1986), pp. 1-8.

if any(imag(x)), error('Parameter must be real.'), end

n = max(size(x));

if n == 1
%  Handle scalar x.
   n = x;
   x = rand(n-1,1)*2*pi;
   H = eye(n);
   H(n,n) = sign(randn);
else
   H = eye(n);
   H(n,n) = sign(x(n)) + (x(n)==0);   % Second term ensures H(n,n) nonzero.
end

for i=n:-1:2
    % Apply Givens rotation through angle x(i-1).
    theta = x(i-1);
    c = cos(theta);
    s = sin(theta);
    H( [i-1 i], : ) = [ c*H(i-1,:)+s*H(i,:)
                       -s*H(i-1,:)+c*H(i,:) ];
end
