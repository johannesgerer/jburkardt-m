function y = daub2_scale ( n, x )

%*****************************************************************************80
%
%% DAUB2_SCALE recursively evaluates the DAUB2 scaling function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the recursion level.
%
%    Input, real X, the point at which the function is to be evaluated.
%
%    Output, real Y, the estimated value of the function.
%
  c = [ 7.071067811865475E-01; ...
        7.071067811865475E-01 ];

  c = c * sqrt ( 2.0 );

  if ( 0 < n )
    y = ( c(1) * daub2_scale ( n - 1, 2 * x     ) ...
        + c(2) * daub2_scale ( n - 1, 2 * x - 1 ) );
  else
    y = ( 0 <= x & x < 1 );
  end

  return
end
