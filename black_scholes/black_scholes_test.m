function black_scholes_test ( )

%*****************************************************************************80
%
%% BLACK_SCHOLES_TEST tests BLACK_SCHOLES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLACK_SCHOLES_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the BLACK_SCHOLES library.\n' );

  asset_path_test ( );

  binomial_test ( );

  bsf_test ( );

  forward_test ( );

  mc_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLACK_SCHOLES_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
