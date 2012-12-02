function cnoise_test03 ( m, n, r, alpha )

%*****************************************************************************80
%
%% CNOISE_TEST03 tests F_ALPHA_UNIFORM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 April 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of realizations to create.
%
%    Input, integer N, the size of the noise vector.
%
%    Input, real R, the range of the distribution.
%
%    Input, real ALPHA, the value of ALPHA.
%
  scale = exp ( 0.5 * ( 1.0 - alpha ) * log ( n ) );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CNOISE_TEST03:\n' );
  fprintf ( 1, '  Test F_ALPHA_UNIFORM.\n' );
  fprintf ( 1, '  Noise is generated from a Gaussian distribution\n' );
  fprintf ( 1, '  with a specified variance.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of realizations M = %d\n', m );
  fprintf ( 1, '  Dimension of noise vector N = %d\n', n );
  fprintf ( 1, '  Noise exponent ALPHA = %f\n', alpha );
  fprintf ( 1, '  Range of the distribution = [%f,%f]\n', -r, r );
  fprintf ( 1, '  Scale factor SCALE = %f\n', scale );

  res = zeros ( m, 1 );

  tic
  for i = 1 : m
    x = f_alpha_gaussian ( n, r, alpha );
    x = scale * x;
    res(i) = mean ( x );
  end
  result_time = toc;

  result_mean = mean ( res );
  result_std = std ( res );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Mean value of noise = %f\n', result_mean );
  fprintf ( 1, '  STD of noise        = %f\n', result_std );
  fprintf ( 1, '  Computation time    = %f seconds\n', result_time );

  return
end
