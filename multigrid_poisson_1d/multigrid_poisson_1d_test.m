function multigrid_poisson_1d_test ( )

%*****************************************************************************80
%
%% MULTIGRID_POISSON_1D_TEST tests MULTIGRID_POISSON_1D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 December 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MULTIGRID_POISSON_1D_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the MULTIGRID_POISSON_1D multigrid library.\n' );

  multigrid_poisson_1d_test01_mono ( );
  multigrid_poisson_1d_test01_multi ( );
  multigrid_poisson_1d_test02_mono ( );
  multigrid_poisson_1d_test02_multi ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MULTIGRID_POISSON_1D_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
