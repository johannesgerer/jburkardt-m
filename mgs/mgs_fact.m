function [R, Q] = mgs_fact ( C )

% mgsfact  Modified-Gram-Schmidt algorithm.
%      Given m x n matrix C, modified Gram-Schmidt decomposes C such that
%      C = Q*R, where Q is an m x min(m,n) orthogonal matrix
%                 and R is an min(m,n) x n upper triangular matrix.
%
%      Reference: Golub and van Loan, Matrix Computations, Sec 5.2.8
%      written by Dianne O'Leary, 09/2005, as an improvement to
%         posted.m

% Check that C is a numeric array and return if not.

if (~isa(C,'numeric'))
  disp('Error: Input to function mgs must be a numeric array.')
  R=[];
  Q=[];
  return
end

% Determine the size of C.

[m,n] = size(C);

% Allocate storage for R and Q.

R = zeros(min(m,n),n);
Q = zeros(m,min(m,n));

% Consider column k of C (k=1:min(m,n)),
%     Store it in column k of Q, after normalizing to length 1.
%     Orthogonalize each of the later columns of C against it,
%     saving the inner products in the k-th row of R.

for k = 1:min(m,n)
   R(k,k) = norm(C(:,k));
   Q(:,k) = C(:,k)/R(k,k);
   for j = k+1:n
      R(k,j) = Q(:,k)'*C(:,j);
      C(:,j) = C(:,j) - Q(:,k)*R(k,j);
   end
end

