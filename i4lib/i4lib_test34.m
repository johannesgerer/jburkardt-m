function i4lib_test34 ( )

%*****************************************************************************80
%
%% TEST34 tests I4MAT_PERM_UNIFORM.
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
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST34\n' );
  fprintf ( 1, '  I4MAT_PERM_UNIFORM applies a random permutation\n' );
  fprintf ( 1, '  to a square integer matrix.\n' );
 
  seed = 123456789;

  for i = 1 : n
    for j = 1 : n
      a(i,j) = 10 * i + j;
    end
  end

  i4mat_print ( n, n, a, '  The original matrix:' );

  [ a, seed ] = i4mat_perm_uniform ( n, a, seed );

  i4mat_print ( n, n, a, '  The permuted matrix:' );

  return
end
