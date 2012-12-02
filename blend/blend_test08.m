function blend_test08 ( )

%*****************************************************************************80
%
%% BLEND_TEST08 tests BLEND_IJ_W_1D1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 October 2008
%
%  Author:
%
%    John Burkardt
%
  n1 = 5;
  n2 = 5;

  rad = 3.0;

  x(1:n1,1:n2) = 0.0;
  y(1:n1,1:n2) = 0.0;
%
%  Set the boundary values.
%
%  It turns out that our values correspond to the X and Y
%  coordinates of a quarter circle of radius 3, although
%  it is by no means necessary that a formula for the data
%  be known.
%
  for i = 1 : n1
    rr = ( ( i - 1 ) / real ( n1 - 1 ) )^2;
    r(i) = rr;
    x(i,1) = 0.0;
    y(i,1) = 0.0;
    x(i,n2) = rad * cos ( 0.5 * pi * ( 1.0 - rr ) );
    y(i,n2) = rad * sin ( 0.5 * pi * ( 1.0 - rr ) );
  end

  for j = 1 : n2
    ss = ( ( j - 1 ) / ( n2 - 1 ) )^2;
    s(j) = ss;
    x(1,j) = 0.0;
    y(1,j) = rad * ss;
    x(n1,j) = rad * ss;
    y(n1,j) = 0.0;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLEND_TEST08\n' );
  fprintf ( 1, '  BLEND_IJ_W_1D1 uses blending to fill in the\n' );
  fprintf ( 1, '    interior of a table.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     R           S           X           Y\n' );
  fprintf ( 1, '\n' );

  x = blend_ij_w_1d1 ( x, r, s, n1, n2 );
  y = blend_ij_w_1d1 ( y, r, s, n1, n2 );

  for i = 1 : n1
    fprintf ( 1, '\n' );
    for j = 1 : n2
      fprintf ( 1, '  %10f  %10f  %10f  %10f\n', r(i), s(j), x(i,j), y(i,j) );
    end
  end

  return
end
