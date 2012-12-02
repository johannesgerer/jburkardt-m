function H = hilb(n)
%HILB   Hilbert matrix.
%       HILB(N) is the N-by-N matrix with elements 1/(i+j-1).
%       It is a famous example of a badly conditioned matrix.
%       COND(HILB(N)) grows like EXP(3.5*N).
%       See INVHILB (standard MATLAB routine) for the exact inverse, which
%       has integer entries.
%       HILB(N) is symmetric positive definite, totally positive, and a
%       Hankel matrix.

%       References:
%       M.-D. Choi, Tricks or treats with the Hilbert matrix, Amer. Math.
%           Monthly, 90 (1983), pp. 301-312.
%       N.J. Higham, Accuracy and Stability of Numerical Algorithms,
%           Society for Industrial and Applied Mathematics, Philadelphia, PA,
%           USA, 1996; sec. 26.1.
%       M. Newman and J. Todd, The evaluation of matrix inversion
%           programs, J. Soc. Indust. Appl. Math., 6 (1958), pp. 466-476.
%       D.E. Knuth, The Art of Computer Programming,
%           Volume 1, Fundamental Algorithms, second edition, Addison-Wesley,
%           Reading, Massachusetts, 1973, p. 37.

if n == 1
   H = 1;
else
    H = cauchy( (1:n) - .5);
end
