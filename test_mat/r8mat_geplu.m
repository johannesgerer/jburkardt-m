function [ p, l, u ] = r8mat_geplu ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_GEPLU produces the PLU factors of a real rectangular matrix.
%
%  Discussion:
%
%    The PLU factors of the M by N matrix A are:
%
%      P, an M by M permutation matrix P,
%      L, an M by M unit lower triangular matrix,
%      U, an M by N upper triangular matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2007
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
%    Input, real A(M,N), the matrix to be factored.
%
%    Output, real P(M,M), the permutation factor.
%
%    Output, real L(M,M), the unit lower triangular factor.
%
%    Output, real U(M,N), the upper triangular factor.
%

%
%  Initialize:
%
%    P:=Identity
%    L:=Identity
%    U:=A
%
  p = identity ( m, m );
  l = identity ( m, m );

  u(1:m,1:n) = a(1:m,1:n);
%
%  On step J, find the pivot row and the pivot value.
%
  for j = 1 : min ( m - 1, n )

    pivot_value = 0.0;
    pivot_row = 0;

    for i = j : m

      if ( pivot_value < abs ( u(i,j) ) )
        pivot_value = abs ( u(i,j) );
        pivot_row = i;
      end

    end
%
%  If the pivot row is nonzero, swap rows J and PIVOT_ROW.
%
    if ( pivot_row ~= 0 )

      u = r8row_swap ( m, n, u, j, pivot_row );

      l = r8row_swap ( m, m, l, j, pivot_row );

      l = r8col_swap ( m, m, l, j, pivot_row );

      p = r8col_swap ( m, m, p, j, pivot_row );
%
%  Zero out the entries in column J, from row J+1 to M.
%
      for i = j + 1 : m

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
