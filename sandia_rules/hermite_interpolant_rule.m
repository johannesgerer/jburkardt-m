function w = hermite_interpolant_rule ( n, a, b, x )

%*****************************************************************************80
%
%% HERMITE_INTERPOLANT_RULE: quadrature rule for a Hermite interpolant.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of abscissas.
%
%    Input, real A, B, the integration limits.
%
%    Input, real X(N), the abscissas.
%
%    Output, real W(2*N), the quadrature coefficients, given as
%    pairs for function and derivative values at each abscissa.
%
  nd = 2 * n;

  k = 0;

  w = zeros ( nd, 1 );

  for i = 1 : n

    k = k + 1;
    y(1:n) = 0.0;
    y(i) = 1.0;
    yp(1:n) = 0.0;
    [ xd, yd, xdp, ydp ] = hermite_interpolant ( n, x, y, yp );
    c = dif_to_r8poly ( nd, xd, yd );
    a_value = r8poly_ant_val ( n, c, a );
    b_value = r8poly_ant_val ( n, c, b );
    w(k) = b_value - a_value;

    k = k + 1;
    y(1:n) = 0.0;
    yp(1:n) = 0.0;
    yp(i) = 1.0;
    [ xd, yd, xdp, ydp ] = hermite_interpolant ( n, x, y, yp );
    c = dif_to_r8poly ( nd, xd, yd );
    a_value = r8poly_ant_val ( n, c, a );
    b_value = r8poly_ant_val ( n, c, b );
    w(k) = b_value - a_value;

  end

  return
end
