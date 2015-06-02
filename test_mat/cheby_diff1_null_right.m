function x = cheby_diff1_null_right ( m, n )

%*****************************************************************************80
%
%% CHEBY_DIFF1_NULL_RIGHT returns a right null vector of the CHEBY_DIFF1 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of A.
%
%    Output, real X(N,1), the null vector.
%
  x = zeros ( n, 1 );

  if ( mod ( n, 2 ) == 1 )
    x(1:n,1) = 1.0;
  end

  return
end
