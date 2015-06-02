function r8lib_test120 ( )

%*****************************************************************************80
%
%% R8LIB_TEST120 tests R8VEC_EXPAND_LINEAR.
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
  n = 6;
  fat = 3;
  nfat = ( n - 1 ) * ( fat + 1 ) + 1;

  x =  [ 16.0, 4.0, 0.0, 4.0, 16.0, 36.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST120\n' );
  fprintf ( 1, '  R8VEC_EXPAND_LINEAR linearly interpolates new data\n' );
  fprintf ( 1, '  between old values.\n' );

  r8vec_print ( n, x, '  Original vector:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Expansion factor is %d\n', fat );

  xfat = r8vec_expand_linear ( n, x, fat );

  r8vec_print ( nfat, xfat, '  Fattened vector:' );

  return
end
