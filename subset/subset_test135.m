function subset_test135 ( )

%*****************************************************************************80
%
%% TEST135 tests R8POLY_NVAL.
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
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST135\n' );
  fprintf ( 1, '  R8POLY_NVAL evaluates a Newton polynomial.\n' );

  a = r8vec_indicator ( n );

  x(1:n-1) = a(1:n-1) - 1.0;
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Newton polynomial coefficients:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %10f', a(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Newton polynomial abscissas:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n-1
    fprintf ( 1, '  %10f', x(i) );
  end
  fprintf ( 1, '\n' );
 
  xval = 2.0;
 
  aval = r8poly_nval ( n, a, x, xval );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8POLY (%f) = %f\n', xval, aval );
  fprintf ( 1, '  The correct value is 11.\n' );

  return
end
