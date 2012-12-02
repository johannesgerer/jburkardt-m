function colored_noise_test02 ( alpha, filename )

%*****************************************************************************80
%
%% COLORED_NOISE_TEST02 calls F_ALPHA with different random seeds.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the exponent of the power law.
%
%    Input, string FILENAME, the output filename.
%
%  Local parameters:
%
%    Local, integer N, the number of elements of the sequence 
%    to generate.
%
%    Local, real Q_D, the variance of the sequence.
%
%    Local, integer SEED, the seed for the random number generator.
%
%    Local, real X(N), the sequence.
%
  n_reals = 200;
  n = 128;
  q_d = 1.0;
  seed_init = 123456789;
  seed = seed_init;
%
%  Report parameters.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COLORED_NOISE_TEST02:\n' );
  fprintf ( 1, '  Generating %d realizations\n', n_reals );
  fprintf ( 1, '  Generating %d sample points.\n', n );
  fprintf ( 1, '  1/F^ALPHA noise has ALPHA = %f\n', alpha );
  fprintf ( 1, '  Variance is %f\n', q_d );
  fprintf ( 1, '  Initial random number seed = %d\n', seed );

  x = 1 : n;

  yave = zeros ( size ( n, 1 ) );
  clf
  hold on
  for i = 1 : n_reals
    [ y, seed ] = f_alpha ( n, q_d, alpha, seed );
    yave = yave + y;
    if ( i <= 5 )
      plot ( x, y, 'Linewidth', 1 ); 
    end
  end
  yave = yave / n_reals;
  plot ( x, yave, 'Linewidth', 2, 'Color', 'k' )
  grid on
  title ( sprintf ( 'ALPHA = %g,    5 realizations (blue), 200 averaged realizations (black)', alpha ) );
  hold off

  print ( '-dpng', filename )

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved as "%s"\n', filename );


  return
end
