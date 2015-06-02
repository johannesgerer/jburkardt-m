function t = ref_to_triangle ( tvert1, tvert2, tvert3, r )

%*****************************************************************************80
%
%% REF_TO_TRIANGLE maps points from the reference triangle to a triangle.
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
%    27 June 2014
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
%    Input, real R(2), the coordinates of a point in the
%    reference triangle.
%
%    Output, real T(2), the coordinates of the point in
%    the triangle.
%
  rvert1(1) = - 1.0;
  rvert1(2) = - 1.0 / sqrt ( 3.0 );
  rvert2(1) = + 1.0;
  rvert2(2) = - 1.0 / sqrt ( 3.0 );
  rvert3(1) =   0.0;
  rvert3(2) =   2.0 / sqrt ( 3.0 );

  s = triangle_to_simplex ( rvert1, rvert2, rvert3, r );

  for i = 1 : 2
    t(i) = tvert1(i) * ( 1.0 - s(1) - s(2) ) ...
         + tvert2(i) * s(1) ...
         + tvert3(i) * s(2);
  end

  return
end
