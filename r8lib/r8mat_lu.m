function [ l, p, u ] = r8mat_lu ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_LU computes the LU factorization of an R8MAT.
%
%  Discussion:
%
%    The routine is given an M by N matrix A, and produces
%
%      L, an M by M unit lower triangular matrix,
%      U, an M by N upper triangular matrix, and
%      P, an M by M permutation matrix P,
%
%    so that
%
%      A = P' * L * U.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows in A.
%
%    Input, integer N, the number of columns in A.
%
%    Input, real A(M,N), the M by N matrix to be factored.
%
%    Output, real L(M,M), the M by M unit lower triangular factor.
%
%    Output, real P(M,M), the M by M permutation matrix.
%
%    Output, real U(M,N), the M by N upper triangular factor.
%

%  Initialize:
%
%    U:=A
%    L:=Identity
%    P:=Identity
%
  u(1:m,1:n) = a(1:m,1:n);

  l = r8mat_identity ( m );

  p(1:m,1:m) = l(1:m,1:m);
%
%  On step J, find the pivot row, IPIV, and the pivot value PIVOT.
%
  for j = 1 : min ( m - 1, n )

    pivot = 0.0;
    ipiv = 0;

    for i = j : m

      if ( pivot < abs ( u(i,j) ) )
        pivot = abs ( u(i,j) );
        ipiv = i;
      end

    end
%
%  Unless IPIV is zero, swap rows J and IPIV.
%
    if ( ipiv ~= 0 )

      u = r8row_swap ( m, n, u, j, ipiv );

      l = r8row_swap ( m, m, l, j, ipiv );

      p = r8row_swap ( m, m, p, j, ipiv );
%
%  Zero out the entries in column J, from row J+1 to M.
%
      for i = j+1 : m

        if ( u(i,j) ~= 0.0 )

          l(i,j) = u(i,j) / u(j,j);

          u(i,j) = 0.0;

          u(i,j+1:n) = u(i,j+1:n) - l(i,j) * u(j,j+1:n);

        end

      end

    end

  end

  return
end
