function polynomial_sort_test ( )

%*****************************************************************************80
%
%% POLYNOMIAL_SORT_TEST tests POLYNOMIAL_SORT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYNOMIAL_SORT_TEST\n' );
  fprintf ( 1, '  POLYNOMIAL_SORT sorts a polynomial by exponent index.\n' );

  m = 3;
  o = 6;
  c = [ 0.0, 9.0, -5.0, - 13.0, 7.0, 11.0 ];
  e = [ 12, 4, 2, 33, 1, 5 ];

  title1 = '  Unsorted polynomial:';
  fprintf ( 1, '\n' );
  polynomial_print ( m, o, c, e, title1 );

  [ c, e ] = polynomial_sort ( o, c, e );

  title1 = '  Sorted polynomial:';
  fprintf ( 1, '\n' );
  polynomial_print ( m, o, c, e, title1 );

  return
end

