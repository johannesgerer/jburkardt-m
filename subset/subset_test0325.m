function subset_test0325 ( )

%*****************************************************************************80
%
%% TEST0325 tests I4_GCD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0325\n' );
  fprintf ( 1, '  I4_GCD computes the greatest common divisor\n' );
  fprintf ( 1, '  of two integers.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I     J    I4_GCD(I,J)\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for k = 1 : 15
    [ i, seed ] = i4_uniform ( -5, 15, seed );
    [ j, seed ] = i4_uniform ( 1, 15, seed );
    fprintf ( 1, '  %4d  %4d  %4d\n', i, j, i4_gcd ( i, j ) );
  end

  return
end
