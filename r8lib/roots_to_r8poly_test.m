function roots_to_r8poly_test ( )

%*****************************************************************************80
%
%% ROOTS_TO_R8POLY_TEST tests ROOTS_TO_R8POLY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 March 2015
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  x = [ ...
    1.0; ...
   -4.0; ...
    3.0; ...
    0.0; ...
    3.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ROOTS_TO_R8POLY_TEST:\n' );
  fprintf ( 1, '  ROOTS_TO_R8POLY is given N real roots,\n' );
  fprintf ( 1, '  and constructs the coefficient vector\n' );
  fprintf ( 1, '  of the corresponding polynomial.\n' );

  r8vec_print ( n, x, '  N real roots:' );

  c = roots_to_r8poly ( n, x );

  r8poly_print ( n, c, '  Corresponding polynomial:' );

  return
end
