function hermite_test06 ( )

%*****************************************************************************80
%
%% HERMITE_TEST06 tests HERMITE_BASIS_0 and HERMITE_BASIS_1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 May 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_TEST06:\n' );
  fprintf ( 1, '  HERMITE_BASIS_0 and HERMITE_BASIS_1 evaluate the\n' );
  fprintf ( 1, '  Hermite global polynomial basis functions\n' );
  fprintf ( 1, '  of type 0: associated with function values, and\n' );
  fprintf ( 1, '  of type 1: associated with derivative values.\n' );
%
%  Let y = x^3 + x^2 + x + 1,
%  and compute the Hermite global polynomial interpolant based on two 
%  abscissas:
%
  nd = 2;
  xd = [ 0, 10 ];
  yd = xd.^3 + xd.^2 + xd + 1;
  ypd = 3.0 * xd.^2 + 2.0 * xd + 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Interpolate y = x^3 + x^2 + x + 1.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        XD         Y(XD)      Y''(XD)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : nd
    fprintf ( 1, '  %10.4f  %10.4f  %10.4f\n', xd(i), yd(i), ypd(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '        XV         Y(XV)      H(XV)\n' );
  fprintf ( 1, '\n' );

  xv = linspace ( 0, 10, 11 );

  for i = 1 : 11

    y = xv(i).^3 + xv(i).^2 + xv(i) + 1;

    f01 = hermite_basis_0 ( 2, xd, 1, xv(i) );
    f11 = hermite_basis_1 ( 2, xd, 1, xv(i) );
    f02 = hermite_basis_0 ( 2, xd, 2, xv(i) );
    f12 = hermite_basis_1 ( 2, xd, 2, xv(i) );

    yh = yd(1) * f01 + ypd(1) * f11 + yd(2) * f02 + ypd(2) * f12;

    fprintf ( 1, '  %10.4f  %10.4f  %10.4f\n', xv(i), y, yh );

  end

  return
end
