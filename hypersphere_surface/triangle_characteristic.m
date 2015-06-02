function y = triangle_characteristic ( m, n, x )

%*****************************************************************************80
%
%% TRIANGLE_CHARACTERISTIC evaluates the characteristic function of a triangle.
%
%  Discussion:
%
%    This triangle has vertices (3,0), (1,2), (-2,-1).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points to check.
%
%    Input, real X(M,N), the coordinates of a point.
%
%    Output, real Y(N,1), is 1 if the point is inside the circle, 0 otherwise.
%
  t = [ 3.0, 0.0; 1.0, 2.0; -2.0, -1.0 ]';

  y(1:n,1) = 1;

  for j = 1 : n

    for v1 = 1 : 3
      v2 = mod ( v1, 3 ) + 1;

      if ( 0.0 < ( x(1,j) - t(1,v1) ) * ( t(2,v2) - t(2,v1) ) ...
               - ( x(2,j) - t(2,v1) ) * ( t(1,v2) - t(1,v1) ) )
        y(j,1) = 0;
      end
    end

  end

  return
end

