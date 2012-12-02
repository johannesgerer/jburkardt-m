function i4lib_test61 ( )

%*****************************************************************************80
%
%% TEST61 tests I4VEC_INDICATOR;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST61\n' );
  fprintf ( 1, '  I4VEC_INDICATOR sets A = (1,2,3...,N)\n' );

  a = i4vec_indicator ( n );
 
  i4vec_print ( n, a, '  The "indicator" vector:' );

  return
end
