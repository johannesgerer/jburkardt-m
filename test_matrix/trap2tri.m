function [Q, T] = trap2tri(L)
%TRAP2TRI  Unitary reduction of trapezoidal matrix to triangular form.
%          [Q, T] = TRAP2TRI(L), where L is an m-by-n lower trapezoidal
%          matrix with m >= n, produces a unitary Q such that QL = [T; 0],
%          where T is n-by-n and lower triangular.
%          Q is a product of Householder transformations.

%          Called by RANDSVD.
%
%          Reference:
%          G.H. Golub and C.F. Van Loan, Matrix Computations, second edition,
%          Johns Hopkins University Press, Baltimore, Maryland, 1989.
%          P5.2.5, p. 220.

[n, r] = size(L);

if r > n  | norm(L-tril(L),1)
   error('Matrix must be lower trapezoidal and m-by-n with m >= n.')
end

Q = eye(n);  % To hold product of H.T.s

if r ~= n

   % Reduce nxr L =   r  [L1]  to lower triangular form: QL = [T].
   %                 n-r [L2]                                 [0]

   for j=r:-1:1
       % x is the vector to be reduced, which we overwrite with the H.T. vector.
       x = L(j:n,j);
       x(2:r-j+1) = zeros(r-j,1);  % These elts of column left unchanged.
       s = norm(x)*(sign(x(1)) + (x(1)==0));    % Modification for sign(1)=1.

       % Nothing to do if x is zero (or x=a*e_1, but we don't check for that).
       if s ~= 0
          x(1) = x(1) + s;
          beta = s'*x(1);

          %  Implicitly apply H.T. to pivot column.
          % L(r+1:n,j) = zeros(n-r,1); % We throw these elts away at the end.
          L(j,j) = -s;

          % Apply H.T. to rest of matrix.
          if j > 1
             y = x'*L(j:n, 1:j-1);
             L(j:n, 1:j-1) = L(j:n, 1:j-1) - x*(y/beta);
          end

          % Update H.T. product.
          y = x'*Q(j:n,:);
          Q(j:n,:) = Q(j:n,:) - x*(y/beta);
       end
   end
end

T = L(1:r,:);   % Rows r+1:n have been zeroed out.
