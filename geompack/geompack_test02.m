function geompack_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests R82VEC_PART_QUICK_A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2009
%
%  Author:
%
%    John Burkardt
%
  n = 12;
  ndim = 2;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  R82VEC_PART_QUICK_A reorders a D2 vector\n' );
  fprintf ( 1, '    as part of a quick sort.\n' );
  fprintf ( 1, '  Using initial random number seed = %d\n', seed );

  [ a, seed ] = r8mat_uniform_01 ( ndim, n, seed );

  a(1:ndim,1:n) = 10.0 * a(1:ndim,1:n);

  r8mat_transpose_print ( ndim, n, a, '  Before rearrangment:' );

  [ a, l, r ] = r82vec_part_quick_a ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rearranged array\n' );
  fprintf ( 1, '  Left index =  %d\n', l );
  fprintf ( 1, '  Key index =   %d\n', l+1 );
  fprintf ( 1, '  Right index = %d\n', r );

  r8mat_transpose_print ( ndim, l,     a(1:ndim,1:l),   '  Left half:' );
  r8mat_transpose_print ( ndim, 1,     a(1:ndim,l+1),   '  Key:' );
  r8mat_transpose_print ( ndim, n-l-1, a(1:ndim,l+2:n), '  Right half:' );

  return
end
