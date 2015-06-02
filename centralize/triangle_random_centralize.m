function [ c_est, c1_err, c2_err ] = triangle_random_centralize ( n, v )

%*****************************************************************************80
%
%% TRIANGLE_RANDOM_CENTRALIZE estimates the centroid of a triangle.
%
%  Discussion:
%
%    We generate N points on the surface of a triangle in 2 dimensions.
%    We seek to estimate the centroid of the triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of random points to generate.
%
%    Input, real V(2,3), the vertices of the triangle.
%
%    Output, real C_EST(M,1), the estimated centroid.
%
%    Output, real C1_ERR, the norm of the difference of C_EST and the 
%    area centroid.
%
%    Output, real C2_ERR, the norm of the difference of C_EST and the 
%    boundary centroid.
%
  x = triangle_surface_sample ( n, v );

  c = sum ( v, 2 ) / 3.0;
  c_est = sum ( x, 2 ) / n;
  c1_err = norm ( c - c_est );

  l1 = norm ( v(1:2,2) - v(1:2,1) );
  l2 = norm ( v(1:2,3) - v(1:2,2) );
  l3 = norm ( v(1:2,1) - v(1:2,3) );
  l_sum = l1 + l2 + l3;
  l1 = 0.5 * l1 / l_sum;
  l2 = 0.5 * l2 / l_sum;
  l3 = 0.5 * l3 / l_sum;

  c2(1:2,1) = ( l3 + l1 ) * v(1:2,1) ...
            + ( l1 + l2 ) * v(1:2,2) ...
            + ( l2 + l3 ) * v(1:2,3);

  c2_err = norm ( c2 - c_est );

  return
end
