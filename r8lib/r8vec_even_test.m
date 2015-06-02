function r8lib_test117 ( )

%*****************************************************************************80
%
%% R8LIB_TEST117 tests R8VEC_EVEN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  xlo = 0.0;
  xhi = 99.0;
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST117\n' );
  fprintf ( 1, '  R8VEC_EVEN computes N evenly spaced values\n' );
  fprintf ( 1, '  between XLO and XHI.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  XLO = %f\n', xlo );
  fprintf ( 1, '  XHI = %f\n', xhi );
  fprintf ( 1, '  while N = %d\n', n );
 
  x = r8vec_even ( n, xlo, xhi );
 
  r8vec_print ( n, x, '  Resulting array:' );

  return
end
