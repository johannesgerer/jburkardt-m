function r8col_uniform_abvec_test ( )

%*****************************************************************************80
%
%% R8COL_UNIFORM_ABVEC_TEST tests R8COL_UNIFORM_ABVEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 December 2014
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 4;
  a = [ 0.0, 0.20, 10.0, 52.0, -1.0 ]';
  b = [ 1.0, 0.25, 20.0, 54.0, +1.0 ]';
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8COL_UNIFORM_ABVEC_TEST\n' );
  fprintf ( 1, '  R8COL_UNIFORM_ABVEC computes a random R8COL.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial seed is %d\n', seed );

  [ v, seed ] = r8col_uniform_abvec ( m, n, a, b, seed );

  fprintf ( 1, '\n' );
  for i = 1 : m
    fprintf ( 1, '  %8.4f:    %8.4f  %8.4f  %8.4f  %8.4f    :%8.4f\n', ...
      a(i), v(i,1:n), b(i) );
  end

  return
end
