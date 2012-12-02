function mu = moebius_matrix ( n, a )

%*****************************************************************************80
%
%% MOEBIUS_MATRIX finds the Moebius matrix from a covering relation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    A Nijenhuis and H Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, number of elements in the partially ordered set.
%
%    Input, integer A(N,N).  A(I,J) = 1 if I is covered by J,
%    0 otherwise.
%
%    Output, integer MU(N,N), the Moebius matrix as computed by the routine.
%

%
%  Compute a reordering P of the elements of the partially ordered matrix.
%
  p = triang ( n, a );
%
%  Copy the matrix.
%
  mu(1:n,1:n) = a(1:n,1:n);
%
%  Apply the reordering to MU.
%
  mu = i4mat_perm2 ( n, n, mu, p, p );
%
%  Negate the (strict) upper triangular elements of MU.
%
  for i = 1 : n-1
    mu(i,i+1:n) = -mu(i,i+1:n);
  end
%
%  Compute the inverse of MU.
%
  mu = i4mat_u1_inverse ( n, mu )
%
%  All nonzero elements are reset to 1.
%
  for i = 1 : n
    for j = i : n
      if ( mu(i,j) ~= 0 )
        mu(i,j) = 1;
      end
    end
  end
%
%  Invert the matrix again.
%
  mu = i4mat_u1_inverse ( n, mu );
%
%  Compute the inverse permutation.
%
  for i = 1 : n
    q(p(i)) = i;
  end
%
%  Unpermute the rows and columns of MU.
%
  mu = i4mat_perm2 ( n, n, mu, q, q );

  return
end
