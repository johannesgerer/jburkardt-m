function subset_test136 ( )

%*****************************************************************************80
%
%% TEST136 tests R8POLY_P2T, R8POLY_T2P.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 4;
  a = r8vec_indicator ( n );
  x = 2.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST136\n' );
  fprintf ( 1, '  R8POLY_T2P: Taylor => Power sum;\n' );
  fprintf ( 1, '  R8POLY_P2T: Power sum => Taylor.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Taylor expansion point is X = %f\n', x );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The Taylor coefficients:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %10f', a(i) );
  end
  fprintf ( 1, '\n' );

  a2 = r8poly_t2p ( n, a, x );

  r8poly_print ( n-1, a2, '  The power sum polynomial:' );

  a3 = r8poly_p2t ( n, a2, x );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The recovered Taylor coefficients:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %10f', a3(i) );
  end
  fprintf ( 1, '\n' );
 
  return
end
