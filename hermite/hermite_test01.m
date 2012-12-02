function hermite_test01 ( )

%*****************************************************************************80
%
%% TEST01 uses f(x) = 1 + 2x + 3x^2 at x = 0, 1, 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 May 2011
%
%  Author:
%
%    John Burkardt
%
  n = 3;

  x =  [ 0.0; 1.0;  2.0 ];
  y =  [ 1.0; 6.0; 17.0 ];
  yp = [ 2.0; 8.0; 14.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  HERMITE computes the Hermite interpolant to data.\n' );
  fprintf ( 1, '  Here, f(x) = 1 + 2x + 3x^2.\n' );

  hermite_demo ( n, x, y, yp );

  return
end
