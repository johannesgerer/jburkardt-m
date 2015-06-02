function bivand1_test ( )

%*****************************************************************************80
%
%% BIVAND1_TEST tests BIVAND1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 November 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BIVAND1_TEST:\n' );
  fprintf ( 1, '  Compute a bidimensional Vandermonde matrix\n' );
  fprintf ( 1, '  associated with the total degree polynomials of degree\n' );
  fprintf ( 1, '  less than N.\n' );

  n = 3;
  nn = ( ( n + 1 ) * n ) / 2;

  alpha = [ 1.0; 2.0; 3.0 ];
  beta = [ 10.0; 20.0; 30.0 ];

  r8vec_print ( n, alpha, '  Vandermonde vector ALPHA:' );
  r8vec_print ( n, beta, '  Vandermonde vector BETA:' );

  a = bivand1 ( n, alpha, beta );

  r8mat_print ( nn, nn, a, '  Bidimensional Vandermonde matrix:' );

  return
end
