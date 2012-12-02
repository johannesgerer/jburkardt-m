function [r, q] = mgs (C)

% function [r, q] = mgs (C)
%
%      The function implements the Modified-Gram-Schmidt algorithm.
%      Given an m x n matrix C, modified Gram-Schmidt decomposes C such that
%      C = q*r, where q is an m x n orthogonal matrix and r is an n x n
%      upper triangular matrix.
%  
%      Reference: Golub and van Loan, Matrix Computations, Sec 5.2.8
%      Author: Unknown.    Date:  < 1995
%      Documentation added by Dianne O'Leary, 09/2005


% Determine the size of the input matrix C.

[m,n] = size(C);

% For each column of C, 
%       determine the component orthogonal to all previous columns,
%       normalize to length 1,
%       and store it in the corresponding column of q.

% k records the index of the column of C under consideration.

for k = 1:n

% Copy the k-th column of C into the vector x.

   for j=1:m
      x(j) = C(j,k);
   end

% Compute xn, the Euclidean norm of x.

   xn = 0;
   for j=1:m,
     xn = xn + x(j)*x(j);
   end

% Set the (k,k) element of r to this norm and set the k-th column of q
% to the k-th column of C, normalized to length 1.

   r(k,k) = sqrt(xn);
   for j=1:m,
     q(j,k) = C(j,k)/r(k,k);
   end

% Take the inner product of each of the later columns of C with this
% new vector.  Record the inner products in row k of r, and modify the
% columns of C to make them orthogonal to the new vector.

   for j = k+1:n
      r(k,j) = 0;
      for p=1:m
        r(k,j) = r(k,j) + q(p,k)'*C(p,j);
      end
      for p=1:m
        C(p,j) = C(p,j) - q(p,k)*r(k,j);
      end
   end  % for j
end     % for k

