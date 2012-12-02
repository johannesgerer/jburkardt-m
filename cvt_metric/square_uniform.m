function p = square_uniform ( n )

%*****************************************************************************80
%
%% SQUARE_UNIFORM returns sample points from the unit square.
%
%  Discussion:
%
%    This routine returns N points sampled uniformly at random
%    from within the unit square.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 May 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points to generate.
%
%    Output, real P(N,2), the sample points.
%
  p = rand ( n, 2 );

  return
end
