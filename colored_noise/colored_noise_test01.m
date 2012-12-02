function colored_noise_test01 ( n, q_d, alpha, seed_init )

%*****************************************************************************80
%
%% COLORED_NOISE_TEST01 calls F_ALPHA with particular parameters.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of elements of the sequence 
%    to generate.
%
%    Input, real Q_D, the variance of the sequence.
%
%    Input, real ALPHA, the exponent of the power law.
%
%    Input, integer SEED_INIT, the initial seed for the 
%    random number generator.
%
  output_filename = sprintf ( 'alpha_%4.2f.txt', alpha );
%
%  Report parameters.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COLORED_NOISE_TEST01:\n' );
  fprintf ( 1, '  Generating %d sample points.\n', n );
  fprintf ( 1, '  1/F^ALPHA noise has ALPHA = %f\n', alpha );
  fprintf ( 1, '  Variance is %f\n', q_d );
  fprintf ( 1, '  Initial random number seed = %d\n', seed_init );

  seed = seed_init;

  [ x, seed ] = f_alpha ( n, q_d, alpha, seed );
%
%  Print no more than 10 entries of the data.
%
  r8vec_print_part ( n, x, 10, '  Noise sample:' );
%
%  Write the data to a file.
%
  output_unit = fopen ( output_filename, 'wt' );

  for i = 1 : n
    fprintf ( output_unit, '%f\n', x(i) );
  end

  fclose ( output_unit );

  fprintf ( 1, '  Data written to file "%s".\n', output_filename );

  return
end
