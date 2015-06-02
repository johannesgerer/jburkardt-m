function r8vec_polarize_test ( )

%*****************************************************************************80
%
%% R8VEC_POLARIZE_TEST tests R8VEC_POLARIZE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 June 2011
%
%  Author:
%
%    John Burkardt
%
  n = 3;

  a = [ 1.0; 2.0;  3.0 ];
  p = [ 3.0; 1.0; -2.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_POLARIZE_TEST\n' );
  fprintf ( 1, '  R8VEC_POLARIZE decomposes a vector into\n' );
  fprintf ( 1, '  components parallel and normal to a direction.\n' );

  r8vec_print ( n, a, '  Original vector:' );

  r8vec_print ( n, p, '  Direction vector:' );

  [ a_normal, a_parallel ] = r8vec_polarize ( n, a, p );

  r8vec_print ( n, a_normal, '  Normal component:' );

  r8vec_print ( n, a_parallel, '  Parallel component:' );

  pan = p(1:n)' * a_normal(1:n);

  p_norm = norm ( p );
  ap_norm = norm ( a_parallel );

  pap = ( p(1:n)' * a_parallel(1:n) ) / ( p_norm * ap_norm );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Dot product of P and A_normal (should be 0) %f\n', pan );
  fprintf ( 1, ...
    '  Cosine of angle between P and A_parallel (should be 1 or -1) %f\n', pap );

  a2(1:n) = a_normal(1:n) + a_parallel(1:n);

  r8vec_print ( n, a2, '  Sum of components (should equal A):' );

  return
end
