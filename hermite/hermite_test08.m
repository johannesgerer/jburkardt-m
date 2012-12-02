function hermite_test08 ( )

%*****************************************************************************80
%
%% HERMITE_TEST08 tabulates the interpolant and its derivative. 
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_TEST08\n' );
  fprintf ( 1, '  HERMITE_INTERPOLANT sets up the Hermite interpolant.\n' );
  fprintf ( 1, '  HERMITE_INTERPOLANT_VALUE evaluates it.\n' );
  fprintf ( 1, '  Consider data for y=sin(x) at x=0,1,2,3,4.\n' );

  n = 5;

  nd = 2 * n;

  ndp = 2 * n - 1;

  x = linspace ( 0.0, 4.0, n );
  y(1:n) = sin ( x(1:n) );
  yp(1:n) = cos ( x(1:n) );

  [ xd, yd, xdp, ydp ] = hermite_interpolant ( n, x, y, yp );
%
%  Now sample the interpolant at NS points, which include data values.
%
  ns = 4 * ( n - 1 ) + 1;

  xs = linspace ( 0.0, 4.0, ns );

  [ ys, ysp ] = hermite_interpolant_value ( nd, xd, yd, xdp, ydp, ns, xs );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  In the following table, there should be perfect\n' );
  fprintf ( 1, '  agreement between F and H, and F'' and H''\n' );
  fprintf ( 1, '  at the data points X = 0, 1, 2, 3, and 4.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In between, H and H'' approximate F and F''.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I       X(I)          F(X(I))         H(X(I))' );
  fprintf ( 1, '        F''(X(I))        H''(X(I))\n' );
  fprintf ( 1, '\n' );
  for i = 1 : ns
    fprintf ( 1, '  %4d  %14.6g  %14.6g  %14.6g  %14.6g  %14.6g\n', ...
      i, xs(i), sin ( xs(i) ), ys(i), cos ( xs(i) ), ysp(i) );
  end

  return
end
