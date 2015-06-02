function x = cheby_diff1_null_left ( m, n )

%*****************************************************************************80
%
%% CHEBY_DIFF1_NULL_LEFT returns a left null vector of the CHEBY_DIFF1 matrix.
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
%    Output, real X(M,1), the null vector.
%
  x = zeros ( m, 1 );

  if ( mod ( m, 2 ) == 1 )

    x(1,1) = 1.0;
    t = -2.0;
    for i = 2 : m - 1
      x(i,1) = t;
      t = -t;
    end
    x(m,1) = 1.0;

  end

  return
end
