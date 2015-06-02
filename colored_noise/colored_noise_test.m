function colored_noise_test ( )

%*****************************************************************************80
%
%% COLORED_NOISE_TEST tests the COLORED_NOISE library.
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
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COLORED_NOISE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the COLORED_NOISE library.\n' );

  n = 128;
  q_d = 1.0;
  alpha = 0.00;
  seed_init = 123456789;

  for i = 0 : 8
    alpha = 0.25 * i;
    colored_noise_test01 ( n, q_d, alpha, seed_init );
  end

  alpha = 0.0;
  colored_noise_test02 ( alpha, 'alpha_0.00_paths.png' );

  alpha = 0.5;
  colored_noise_test02 ( alpha, 'alpha_0.50_paths.png' );

  alpha = 1.0;
  colored_noise_test02 ( alpha, 'alpha_1.00_paths.png' );

  alpha = 1.5;
  colored_noise_test02 ( alpha, 'alpha_1.50_paths.png' );

  alpha = 2.0;
  colored_noise_test02 ( alpha, 'alpha_2.00_paths.png' );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COLORED_NOISE_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
