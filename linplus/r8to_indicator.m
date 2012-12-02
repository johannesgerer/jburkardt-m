function a = r8to_indicator ( n )

%*****************************************************************************80
%
%% R8TO_INDICATOR sets up a R8TO indicator matrix.
%
%  Discussion:
%
%    The R8TO storage format is used for a real Toeplitz matrix, which 
%    is constant along diagonals.  Thus, in an N by N Toeplitz matrix, 
%    there are at most 2*N-1 distinct entries.  The format stores the 
%    N elements of the first row, followed by the N-1 elements of the 
%    first column (skipping the entry in the first row).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2004
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
%    Output, real A(2*N-1), the R8TO matrix.
%
  fac = 10^( i4_log_10 ( n ) + 1 );

  i = 1;
  k = 0;
  for j = 1 : n
    k = k + 1;
    a(k) = fac * i + j;
  end

  j = 1;
  for i = 2 : n
    k = k + 1;
    a(k) = fac * i + j;
  end
  
  return
end
