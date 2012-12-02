function [L, D, P, rho] = diagpiv(A)
%DIAGPIV     Diagonal pivoting factorization with partial pivoting.
%            Given a symmetric matrix A,
%            [L, D, P, rho] = diagpiv(A) computes a permutation P,
%            a unit lower triangular L, and a block diagonal D
%            with 1x1 and 2x2 diagonal blocks, such that
%            P*A*P' = L*D*L'.
%            The Bunch-Kaufman partial pivoting strategy is used.
%            Rho is the growth factor.

%            Reference:
%            J.R. Bunch and L. Kaufman, Some stable methods for calculating
%            inertia and solving symmetric linear systems, Math. Comp.,
%            31(137):163-179, 1977.

%            This routine does not exploit symmetry and is not designed to be
%            efficient.

if norm(triu(A,1)'-tril(A,-1),1), error('Must supply symmetric matrix.'), end

n = max(size(A));
k = 1;
D = eye(n);
L = eye(n);
pp = 1:n;
normA = norm(A(:),inf);
rho = normA;

alpha = (1 + sqrt(17))/8;

while k < n
      [lambda, r] = max( abs(A(k+1:n,k)) );
      r = r(1) + k;

      if lambda > 0
          swap = 0;
          if abs(A(k,k)) >= alpha*lambda
             s = 1;
          else
             temp = A(k:n,r); temp(r-k+1) = 0;
             sigma = norm(temp, inf);
             if alpha*lambda^2 <= abs(A(k,k))*sigma
                s = 1;
             elseif abs(A(r,r)) >= alpha*sigma
                swap = 1;
                m1 = k; m2 = r;
                s = 1;
             else
                swap = 1;
                m1 = k+1; m2 = r;
                s = 2;
             end
          end

          if swap
             A( [m1, m2], : ) = A( [m2, m1], : );
             L( [m1, m2], : ) = L( [m2, m1], : );
             A( :, [m1, m2] ) = A( :, [m2, m1] );
             L( :, [m1, m2] ) = L( :, [m2, m1] );
             pp( [m1, m2] ) = pp( [m2, m1] );
          end

          if s == 1

             D(k,k) = A(k,k);
             A(k+1:n,k) = A(k+1:n,k)/A(k,k);
             L(k+1:n,k) = A(k+1:n,k);
             i = k+1:n;
             A(i,i) = A(i,i) - A(i,k) * A(k,i);

          elseif s == 2

             E = A(k:k+1,k:k+1);
             D(k:k+1,k:k+1) = E;
             C = A(k+2:n,k:k+1);
             temp = C/E;
             L(k+2:n,k:k+1) = temp;
             A(k+2:n,k+2:n) = A(k+2:n,k+2:n) - temp*C';

         end

         if k+s <= n
            rho = max(rho, max(max(abs(A(k+s:n,k+s:n)))) );
         end

      else  % Nothing to do.

         s = 1;
         D(k,k) = A(k,k);

      end

      k = k + s;

      if k == n
         D(n,n) = A(n,n);
         break
      end

end

if nargout >= 3, P = eye(n); P = P(pp,:); end
rho = rho/normA;
