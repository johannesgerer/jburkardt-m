function A = minij(n)
%MINIJ   Symmetric positive definite matrix MIN(i,j).
%        A = MINIJ(N) is the N-by-N symmetric positive definite matrix with
%        A(i,j) = MIN(i,j).
%        Properties, variations:
%        INV(A) is tridiagonal: it is minus the second difference matrix
%                    except its (N,N) element is 1.
%        2*A-ONES(N) (Givens' matrix) has tridiagonal inverse and
%                    eigenvalues .5*sec^2([2r-1)PI/4N], r=1:N.
%        (N+1)*ONES(N)-A also has a tridiagonal inverse.

%        References:
%        J. Todd, Basic Numerical Mathematics, Vol. 2: Numerical Algebra,
%           Birkhauser, Basel, and Academic Press, New York, 1977, p. 158.
%        D.E. Rutherford, Some continuant determinants arising in physics and
%           chemistry---II, Proc. Royal Soc. Edin., 63, A (1952), pp. 232-241.
%           (For the eigenvalues of Givens' matrix.)

A = min( ones(n,1)*(1:n), (1:n)'*ones(1,n) );
