function subset_test107 ( )

%*****************************************************************************80
%
%% TEST107 tests PERM_TO_YTB.
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
  n = 7;
  p = [ 7, 2, 4, 1, 5, 3, 6 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST107\n' );
  fprintf ( 1, '  PERM_TO_YTB converts a permutation to a\n' );
  fprintf ( 1, '  Young tableau.\n' );

  perm_print ( n, p, '  The permutation:' );
 
  [ lambda, a ] = perm_to_ytb ( n, p );

  ytb_print ( n, a, '  The Young tableau:' );

  return
end
