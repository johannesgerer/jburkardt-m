function i4lib_test70 ( )

%*****************************************************************************80
%
%% TEST70 tests I4VEC_PART_QUICK_A.
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
  n = 12;
  b = 0;
  c = n;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST70\n' );
  fprintf ( 1, '  I4VEC_PART_QUICK_A reorders an integer vector\n' );
  fprintf ( 1, '  as part of a quick sort.\n' );
  fprintf ( 1, '  Using initial random number seed = %d\n', seed );

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );

  i4vec_print ( n, a, '  Before rearrangement:' );

  [ a, l, r ] = i4vec_part_quick_a ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rearranged array\n' );
  fprintf ( 1, '  Left index =  %d\n', l );
  fprintf ( 1, '  Key index =   %d\n', l+1 );
  fprintf ( 1, '  Right index = %d\n', r );

  i4vec_print ( l,     a(1:l),   '  Left half:' );
  i4vec_print ( 1,     a(l+1),   '  Key:' );
  i4vec_print ( n-l-1, a(l+2:n), '  Right half:' );

  return
end
