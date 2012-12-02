function sandia_cubature_test ( )

%*****************************************************************************80
%
%% SANDIA_CUBATURE_TEST tests SANDIA_CUBATURE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_CUBATURE_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the SANDIA_CUBATURE library.\n' );

  cn_geg_tests ( );
  cn_jac_tests ( );
  cn_leg_tests ( );
  en_her_tests ( );
  epn_glg_tests ( );
  epn_lag_tests ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_CUBATURE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
