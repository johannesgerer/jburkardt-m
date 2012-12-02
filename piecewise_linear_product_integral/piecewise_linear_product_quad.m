function quad = piecewise_linear_product_quad ( a, b, f_num, f_x, f_v, ...
  g_num, g_x, g_v, quad_num )

%*****************************************************************************80
%
%% PIECEWISE_LINEAR_PRODUCT_QUAD: estimate piecewise linear product integral.
%
%  Discussion:
%
%    We are given two piecewise linear functions F(X) and G(X) and we wish
%    to estimate the value of the integral
%
%      INTEGRAL = Integral ( A <= X <= B ) F(X) * G(X) dx
%
%    The functions F(X) and G(X) are defined as tables of coordinates X and
%    values V.  A piecewise linear function is evaluated at a point X by
%    evaluating the interpolant to the data at the endpoints of the interval
%    containing X.
%
%    It must be the case that A <= B.
%
%    It must be the case that the node coordinates F_X(*) and G_X(*) are
%    given in ascending order.
%
%    It must be the case that:
%
%      F_X(1) <= A and B <= F_X(F_NUM)
%      G_X(1) <= A and B <= G_X(G_NUM)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the limits of integration.
%
%    Input, integer F_NUM, the number of nodes for F.
%
%    Input, real F_X(F_NUM), the node coordinates for F.
%
%    Input, real F_V(F_NUM), the nodal values for F.
%
%    Input, integer G_NUM, the number of nodes for G.
%
%    Input, real G_X(G_NUM), the node coordinates for G.
%
%    Input, real G_V(G_NUM), the nodal values for G.
%
%    Input, integer QUAD_NUM, the number of quadrature points.
%
%    Output, real QUAD, an estimate for the integral of F(X) * G(X)
%    from A to B.
%
  quad = 0.0;

  f_left = 1;
  g_left = 1;

  a2 = a;
  a2 = max ( a2, f_x(1) );
  a2 = max ( a2, g_x(1) );

  b2 = b;
  b2 = min ( b2, f_x(f_num) );
  b2 = min ( b2, g_x(g_num) );

  for i = 1 : quad_num

    xq =  ( (                2 * i - 1 ) * b2 ...
          + ( 2 * quad_num - 2 * i + 1 ) * a2 )  ...
          / ( 2 * quad_num             );

    f_left = r8vec_bracket3 ( f_num, f_x, xq, f_left );

    fq = f_v(f_left) + ( xq - f_x(f_left) ) * ( f_v(f_left+1) - f_v(f_left) ) ...
      / ( f_x(f_left+1) - f_x(f_left) );

    g_left = r8vec_bracket3 ( g_num, g_x, xq, g_left );

    gq = g_v(g_left) + ( xq - g_x(g_left) ) * ( g_v(g_left+1) - g_v(g_left) ) ...
      / ( g_x(g_left+1) - g_x(g_left) );

    quad = quad + fq * gq;

  end

  quad = quad * ( b - a ) / quad_num;

  return
end
