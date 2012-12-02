function r8lib_test132 ()

%*****************************************************************************80
%
%% TEST132 tests R8VEC_PERMUTE.
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

  perm = [ 2, 4, 5, 1, 3 ];
  x = [ 1.0, 2.0, 3.0, 4.0, 5.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST132\n' );
  fprintf ( 1, '  R8VEC_PERMUTE permutes a DVEC in place.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, Perm(I), X(I)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %8d  %8d  %12f\n', i, perm(i), x(i) );
  end

  x = r8vec_permute ( n, x, perm );

  r8vec_print ( n, x, '  Permuted array:' );

  return
end
