function spline_test235 ( )

%*****************************************************************************80
%
%% TEST235 tests SPLINE_PCHIP_SET and SPLINE_PCHIP_VAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 August 2005
%
%  Author
%
%    John Burkardt
%
  n = 21;
  ne = 101;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST235\n' );
  fprintf ( 1, '  SPLINE_PCHIP_SET sets up a piecewise cubic \n' );
  fprintf ( 1, '    Hermite interpolant.\n' );
  fprintf ( 1, '  SPLINE_PCHIP_VAL evaluates the interpolant.\n' );
  fprintf ( 1, '\n' );
%
%  Compute Runge's function at N points in [-1,1].
%
  for i = 1 : n
    x(i) = -1.0 + ( i - 1 ) / 10.0;
    f(i) = frunge ( x(i) );
  end
%
%  SPLINE_PCHIP_SET takes the data in X and F, and constructs a table in D
%  that defines the interpolant.
%
  d = spline_pchip_set ( n, x, f );
%
%  Evaluate the interpolant and derivative at NE points from -1 to 0.
%
  for i = 1 : ne
    xe(i) = -1.0 + ( i - 1 ) / ( ne - 1 );
  end

  fe = spline_pchip_val ( n, x, f, d, ne, xe );
%
%  Print the table of X, F(exact) and F(interpolated)
%
  for i = 1 : ne
    diff = fe(i) - frunge ( xe(i) );
    fprintf ( 1, '  %8f  %10f  %10f  %14e\n', ...
      xe(i), frunge ( xe(i) ), fe(i), diff );
  end

  return
end
