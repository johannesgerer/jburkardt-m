function q = triangulation_quad ( x_num, x, t_num, t, fx )

%*****************************************************************************80
%
%% TRIANGULATION_QUAD approximates an integral over a triangulation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X_NUM, the number of nodes.
%
%    Input, real X(2,X_NUM), the coordinates of the nodes.
%
%    Input, integer T_NUM, the number of triangles.
%
%    Input, integer T(3,T_NUM), the nodes making up each triangle.
%
%    Input, real FX(X_NUM), the function value at each node.
%
%    Output, real Q, the integral estimate.
%
  q = 0.0;

  for triangle = 1 : t_num

    tx(1:2,1:3) = x(1:2,t(1:3,triangle));

    t_area = 0.5 * abs ( ...
        tx(1,1) * ( tx(2,2) - tx(2,3) ) ...
      + tx(1,2) * ( tx(2,3) - tx(2,1) ) ...
      + tx(1,3) * ( tx(2,1) - tx(2,2) ) );

    q = q + t_area * sum ( fx(t(1:3,triangle)) );

  end

  return
end
