function a = r8pp_indicator ( n )

%*****************************************************************************80
%
%% R8PP_INDICATOR sets up a R8PP indicator matrix.
%
%  Discussion:
%
%    The R8PP storage format is appropriate for a symmetric positive
%    definite matrix.  Only the upper triangle of the matrix is stored,
%    by successive partial columns, in an array of length (N*(N+1))/2,
%    which contains (A11,A12,A22,A13,A23,A33,A14,...,ANN)  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 February 2004
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
%    Output, real A((N*(N+1))/2), the R8PP matrix.
%
  fac = 10^( i4_log_10 ( n ) + 1 );

  k = 0;
  for j = 1 : n
    for i = 1 : j
      k = k + 1;
      a(k) = fac * i + j;
    end
  end

  return
end
