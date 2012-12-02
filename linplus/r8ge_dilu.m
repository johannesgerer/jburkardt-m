function d = r8ge_dilu ( m, n, a )

%*****************************************************************************80
%
%% R8GE_DILU produces the diagonal incomplete LU factor of a R8GE matrix.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage 
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2004
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
%    Output, real D(M), the DILU factor.
%
  for i = 1 : m
    if ( i <= n )
      d(i) = a(i,i);
    else
      d(i) = 0.0E+00;
    end
  end

  for i = 1 : min ( m, n )
    d(i) = 1.0E+00 / d(i); 
    for j = i+1 : min ( m, n )
      d(j) = d(j) - a(j,i) * d(i) * a(i,j);
    end
  end

  return
end
