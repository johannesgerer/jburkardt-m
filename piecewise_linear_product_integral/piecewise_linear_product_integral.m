function integral = piecewise_linear_product_integral ( a, b, f_num, f_x, ...
  f_v, g_num, g_x, g_v )

%*****************************************************************************80
%
%% PIECEWISE_LINEAR_PRODUCT_INTEGRAL: piecewise linear product integral.
%
%  Discussion:
%
%    We are given two piecewise linear functions F(X) and G(X) and we wish
%    to compute the exact value of the integral
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
%    30 April 2009
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
%    Output, real INTEGRAL, the integral of F(X) * G(X)
%    from A to B.
%
  integral = 0.0;

  if ( f_x(f_num) <= a || g_x(g_num) <= a )
    return
  end

  if ( f_num < 2 || g_num < 2 )
    return
  end

  xr = a;

  f_left = 1;
  f_left = r8vec_bracket3 ( f_num, f_x, xr, f_left );
  fr = f_v(f_left) + ( xr - f_x(f_left) ) * ( f_v(f_left+1) - f_v(f_left) ) ...
    / ( f_x(f_left+1) - f_x(f_left) );

  g_left = 1;
  g_left = r8vec_bracket3 ( g_num, g_x, xr, g_left );
  gr = g_v(g_left) + ( xr - g_x(g_left) ) * ( g_v(g_left+1) - g_v(g_left) ) ...
    / ( g_x(g_left+1) - g_x(g_left) );

  xr_max = b;
  xr_max = min ( xr_max, f_x(f_num) );
  xr_max = min ( xr_max, g_x(g_num) );

  while ( xr < xr_max )
%
%  Shift right values to left.
%
    xl = xr;
    fl = fr;
    gl = gr;
%
%  Determine the new right values.
%  The hard part is figuring out how to advance XR some, but not too much.
%
    xr = xr_max;

    for i = 1 : 2
      if ( f_left + i <= f_num )
        if ( xl < f_x(f_left+i) && f_x(f_left+i) < xr )
          xr = f_x(f_left+i);
          break
        end
      end
    end

    for i = 1 : 2
      if ( g_left + i <= g_num )
        if ( xl < g_x(g_left+i) && g_x(g_left+i) < xr )
          xr = g_x(g_left+i);
          break
        end
      end
    end

    f_left = r8vec_bracket3 ( f_num, f_x, xr, f_left );
    fr = f_v(f_left) + ( xr - f_x(f_left) ) * ( f_v(f_left+1) - f_v(f_left) ) ...
      / ( f_x(f_left+1) - f_x(f_left) );

    g_left = r8vec_bracket3 ( g_num, g_x, xr, g_left );
    gr = g_v(g_left) + ( xr - g_x(g_left) ) * ( g_v(g_left+1) - g_v(g_left) ) ...
      / ( g_x(g_left+1) - g_x(g_left) );
%
%  Form the linear polynomials for F(X) and G(X) over [XL,XR],
%  then the product H(X), integrate H(X) and add to the running total.
%
    if ( eps <= abs ( xr - xl ) )

      f1 = fl - fr;
      f0 = fr * xl - fl * xr;

      g1 = gl - gr;
      g0 = gr * xl - gl * xr;

      h2 = f1 * g1;
      h1 = f1 * g0 + f0 * g1;
      h0 = f0 * g0;

      h2 = h2 / 3.0;
      h1 = h1 / 2.0;

      bit = ( ( h2 * xr + h1 ) * xr + h0 ) * xr ...
          - ( ( h2 * xl + h1 ) * xl + h0 ) * xl;

      integral = integral + bit / ( xr - xl ) / ( xr - xl );

    end

  end

  return
end
