function hermite_demo ( n, x, y, yp )

%*****************************************************************************80
%
%% HERMITE_DEMO computes and prints Hermite interpolant information for data.
%
%  Discussion:
%
%    Given a set of Hermite data, this routine calls HDATA_TO_DIF to determine
%    and print the divided difference table, and then DIF_TO_R8POLY to
%    determine and print the coefficients of the polynomial in standard form.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of data points.
%
%    Input, real X(N), the abscissas.
%
%    Input, real Y(N), YP(N), the function and derivative
%    values at the abscissas.
%

%
%  Deal with idiotic row vectors.
%
  x = x(:);
  y = y(:);
  yp = yp(:);

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_DEMO\n' );
  fprintf ( 1, '  Compute coefficients CD of the Hermite polynomial\n' );
  fprintf ( 1, '  interpolant to given data (x,y,yp).\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data:\n' );
  fprintf ( 1, '              X           Y           Y''\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %4d  %10g  %10g  %10g\n', i, x(i), y(i), yp(i) );
  end

  [ xd, yd, xdp, ydp ] = hermite_interpolant ( n, x, y, yp );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Difference table:\n' );
  fprintf ( 1, '              XD          YD\n' );
  fprintf ( 1, '\n' );

  nd = 2 * n;

  for i = 1 : nd
    fprintf ( 1, '  %4d  %10g  %10g\n', i, xd(i), yd(i) );
  end

  cd = dif_to_r8poly ( nd, xd, yd );

  r8poly_print ( nd - 1, cd, '  Hermite interpolating polynomial:' );
%
%  Verify interpolation claim.
%
  nv = n;
  xv(1:nv,1) = x(1:n);

  [ yv, yvp ] = hermite_interpolant_value ( nd, xd, yd, xdp, ydp, nv, xv );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data Versus Interpolant:\n' );
  fprintf ( 1, '              X           Y           H           YP          HP\n' );
  fprintf ( 1, '\n' );
  for i = 1 : nv
    fprintf ( 1, '  %4d  %10g  %10g  %10g  %10g  %10g\n', ...
      i, xv(i), y(i), yv(i), yp(i), yvp(i) );
  end

  return
end
