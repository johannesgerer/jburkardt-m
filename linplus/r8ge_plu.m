function [ p, l, u ] = r8ge_plu ( m, n, a )

%*****************************************************************************80
%
%% R8GE_PLU produces the PLU factors of a R8GE matrix.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage 
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
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
%    20 March 2004
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
%    Input, real A(M,N), the R8GE matrix.
%
%    Output, real P(M,M), the M by M permutation factor.
%
%    Output, real L(M,M), the M by M unit lower triangular factor.
%
%    Output, real U(M,N), the M by N upper triangular factor.
%
  l = r8ge_identity ( m );
  p = r8ge_identity ( m );
  u(1:m,1:n) = a(1:m,1:n);
%
%  On step J, find the pivot row and the pivot value.
%
  for j = 1 : min ( m-1, n )

    pivot_value = 0.0E+00;
    pivot_row = -1;

    for i = j : m

      if ( pivot_value < abs ( u(i,j) ) )
        pivot_value = abs ( u(i,j) );
        pivot_row = i;
      end

    end
%
%  If the pivot row is nonzero, swap rows J and PIVOT_ROW.
%
    if ( pivot_row ~= -1 )

      temp(1:n) = u(j,1:n);
      u(j,1:n) = u(pivot_row,1:n);
      u(pivot_row,1:n) = temp(1:n);

      temp(1:m) = l(j,1:m);
      l(j,1:m) = l(pivot_row,1:m);
      l(pivot_row,1:m) = temp(1:m);

      temp(1:m) = l(1:m,j);
      l(1:m,j) = l(1:m,pivot_row);
      l(1:m,pivot_row) = temp(1:m)';

      temp(1:m) = p(1:m,j);
      p(1:m,j) = p(1:m,pivot_row);
      p(1:m,pivot_row) = temp(1:m)';
%
%  Zero out the entries in column J, from row J+1 to M.
%
      for i = j+1 : m

        if ( u(i,j) ~= 0.0E+00 )

          l(i,j) = u(i,j) / u(j,j);
          u(i,j) = 0.0E+00;
          u(i,j+1:n) = u(i,j+1:n) - l(i,j) * u(j,j+1:n);

        end

      end

    end

  end

  return
end
