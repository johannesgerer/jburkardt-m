function value = r82_dist_l2 ( a1, a2 )

%*****************************************************************************80
%
%% R82_DIST_L2 returns the L2 distance between a pair of R82's.
%
%  Discussion:
%
%    An R82 is a vector of type R8, with two entries.
%
%    The vector L2 norm is defined as:
%
%      sqrt ( sum ( 1 <= I <= N ) A(I) * A(I) ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A1(2), A2(2), the vectors.
%
%    Output, real VALUE, the L2 norm of the distance
%    between A1 and A2.
%
  value = norm ( a1(1:2) - a2(1:2) );

  return
end
