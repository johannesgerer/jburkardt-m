function euler_poly_test ( )

%*****************************************************************************80
%
%% EULER_POLY_TEST tests EULER_POLY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  n = 15;
  x = 0.5;
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EULER_POLY_TEST\n' );
  fprintf ( 1, '  EULER_POLY evaluates Euler polynomials.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N         X              F(X)\n' );
  fprintf ( 1, '\n' );
   
  for i = 0 : n
    f = euler_poly ( i, x );
    fprintf ( 1, '  %2d  %12f  %12f\n', i, x, f );
  end

  return
end
