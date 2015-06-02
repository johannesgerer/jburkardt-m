function stochastic_diffusion_test ( )

%*****************************************************************************80
%
%% STOCHASTIC_DIFFUSION_TEST tests the STOCHASTIC_DIFFUSION library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 July 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( ); 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'STOCHASTIC_DIFFUSION_TEST:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the STOCHASTIC_DIFFUSION library.\n' );

  figure_num = 0;
  figure_num = bnt_contour ( figure_num );
  figure_num = elman_contour ( figure_num );
  figure_num = ntw_contour ( figure_num );
  figure_num = xk_contour ( figure_num );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'STOCHASTIC_DIFFUSION_TEST:\n' );
  fprintf ( 1, '  Test the STOCHASTIC_DIFFUSION library.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
