function a = r8sto_indicator ( n )

%*****************************************************************************80
%
%% R8STO_INDICATOR sets up a R8STO indicator matrix.
%
%  Discussion:
%
%    The R8STO storage format is used for a symmetric Toeplitz matrix.
%    It stores the N elements of the first row.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Output, real A(N), the R8STO matrix.
%
  fac = 10^( i4_log_10 ( n ) + 1 );

  i = 1;
  k = 0;
  for j = 1 : n
    k = k + 1;
    a(k) = fac * i + j;
  end

  return
end
