function r8vec_permute_test ( )

%*****************************************************************************80
%
%% RR8VEC_PERMUTE_TEST tests R8VEC_PERMUTE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 October 2014
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  p = [ 2, 4, 5, 1, 3 ];
  x = [ 1.0, 2.0, 3.0, 4.0, 5.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_PERMUTE_TEST\n' );
  fprintf ( 1, '  R8VEC_PERMUTE permutes an R8VEC.\n' );

  r8vec_print ( n, x, '  Original array X[]:' )

  i4vec_print ( n, p, '  Permutation vector P[]:' )

  x = r8vec_permute ( n, x, p );

  r8vec_print ( n, x, '  Permuted array X[P[]]:' );

  return
end
