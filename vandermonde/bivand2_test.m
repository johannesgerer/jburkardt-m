function bivand2_test ( )

%*****************************************************************************80
%
%% BIVAND2_TEST tests BIVAND2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 May 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BIVAND2_TEST:\n' );
  fprintf ( 1, '  Compute a bidimensional Vandermonde matrix\n' );
  fprintf ( 1, '  associated with the product polynomials of\n' );
  fprintf ( 1, '  maximum degree less than N.\n' );

  n = 3;
  nn = n^2;

  alpha = [ 1.0; 2.0; 3.0 ];
  beta = [ 10.0; 20.0; 30.0 ];

  r8vec_print ( n, alpha, '  Vandermonde vector ALPHA:' );
  r8vec_print ( n, beta, '  Vandermonde vector BETA:' );

  a = bivand2 ( n, alpha, beta );

  r8mat_print ( nn, nn, a, '  Bidimensional Vandermonde matrix:' );

  return
end
