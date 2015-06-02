function r = triangle_to_ref ( tvert1, tvert2, tvert3, t )

%*****************************************************************************80
%
%% TRIANGLE_TO_REF maps points from any triangle to the reference triangle.
%
%  Discussion:
%
%    The reference triangle has vertices:
%
%      ( -1, -1/sqrt(3) )
%      ( +1, -1/sqrt(3) )
%      (  0, +2/sqrt(3) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real TVERT1(2), TVERT2(2), TVERT3(2), the coordinates
%    of the vertices of the triangle.  These vertices will be taken
%    to be the images of (0,0), (1,0) and (0,1) respectively.
%
%    Input, real T(2), the coordinates of a point in the triangle.
%
%    Output, real R(2), the coordinates of a point in the
%    reference triangle.
%
  s = triangle_to_simplex ( tvert1, tvert2, tvert3, t );

  rvert1(1) = - 1.0;
  rvert1(2) = - 1.0 / sqrt ( 3.0 );
  rvert2(1) = + 1.0;
  rvert2(2) = - 1.0 / sqrt ( 3.0 );
  rvert3(1) =   0.0;
  rvert3(2) =   2.0 / sqrt ( 3.0 );

  r = simplex_to_triangle ( rvert1, rvert2, rvert3, s );

  return
end