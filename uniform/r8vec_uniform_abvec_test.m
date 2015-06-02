function r8vec_uniform_abvec_test ( )

%*****************************************************************************80
%
%% R8VEC_UNIFORM_ABVEC_TEST tests  R8VEC_UNIFORM_ABVEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    27 December 2014
%
%  Author:
%
%    John Burkardt
%
  n = 5;
  a = [ 0.0, 0.20, 10.0, 52.0, -1.0 ]';
  b = [ 1.0, 0.25, 20.0, 54.0, +1.0 ]';
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_UNIFORM_ABVEC_TEST\n' );
  fprintf ( 1, '  R8VEC_UNIFORM_ABVEC computes a random R8VEC.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial seed is %d\n', seed );

  [ v, seed ] = r8vec_uniform_abvec ( n, a, b, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   I         A         X         B\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %4d  %8.4f  %8.4f  %8.4f\n', i, a(i), v(i), b(i) );
  end

  return
end
