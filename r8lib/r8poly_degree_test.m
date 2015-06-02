function r8poly_degree_test ( )

%*****************************************************************************80
%
%% R8POLY_DEGREE_TEST tests R8POLY_DEGREE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 January 2015
%
%  Author:
%
%    John Burkardt
%
  c1 = [ 1.0, 2.0, 3.0, 4.0 ]';
  c2 = [ 1.0, 2.0, 3.0, 0.0 ]';
  c3 = [ 1.0, 2.0, 0.0, 4.0 ]';
  c4 = [ 1.0, 0.0, 0.0, 0.0 ]';
  c5 = [ 0.0, 0.0, 0.0, 0.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8POLY_DEGREE_TEST\n' );
  fprintf ( 1, '  R8POLY_DEGREE determines the degree of an R8POLY.\n' );

  m = 3;

  r8poly_print ( m, c1, '  The R8POLY:' );
  d = r8poly_degree ( m, c1 );
  fprintf ( 1, '  Dimensioned degree = %d,  Actual degree = %d\n', m, d );

  r8poly_print ( m, c2, '  The R8POLY:' );
  d = r8poly_degree ( m, c2 );
  fprintf ( 1, '  Dimensioned degree = %d,  Actual degree = %d\n', m, d );

  r8poly_print ( m, c3, '  The R8POLY:' );
  d = r8poly_degree ( m, c3 );
  fprintf ( 1, '  Dimensioned degree = %d,  Actual degree = %d\n', m, d );

  r8poly_print ( m, c4, '  The R8POLY:' );
  d = r8poly_degree ( m, c4 );
  fprintf ( 1, '  Dimensioned degree = %d,  Actual degree = %d\n', m, d );

  r8poly_print ( m, c5, '  The R8POLY:' );
  d = r8poly_degree ( m, c5 );
  fprintf ( 1, '  Dimensioned degree = %d,  Actual degree = %d\n', m, d );

  return
end