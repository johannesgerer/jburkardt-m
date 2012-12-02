function h = p18_fh_nonuniform ( p )

%*****************************************************************************80
%
%% P18_FH_NONUNIFORM is a nonuniform mesh density function for problem 18.
%
%  Discussion:
%
%    We want small triangles near the boundaries of the domain, and
%    larger ones in the interior.  To achieve this, we assume that P
%    represents a large sampling of points in the region; we compute
%    the minimum and maximum distances of the points to the boundary,
%    and we assign mesh density values of HMIN to the closest points,
%    HMAX to the furthest ones, and linearly vary H between them. 
%
%    Note that the points inside the region have negative signed distance,
%    and those furthest from the boundary have the most negative value.
%    Thus, we take the absolute value of this distance to get the positive
%    distance we would prefer to work with.  The program does not expect to
%    receive input points which are actually outside the region.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 August 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P(N,2), one or more points, where the mesh density function
%    is to be evaluated.
%
%    Output, real H(N), the value of the mesh density function H(P).
%
  hmax = 5;
  hmin = 1;
  dmax = max ( abs ( p18_fd ( p ) ) );
  dmin = min ( abs ( p18_fd ( p ) ) );

  h = ( ( dmax - abs ( p18_fd ( p ) )        ) * hmin   ...
      + (        abs ( p18_fd ( p ) ) - dmin ) * hmax ) ...
      / ( dmax                        - dmin );

  return
end

