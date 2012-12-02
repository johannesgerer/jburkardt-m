function stochastic_rk_test ( )

%*****************************************************************************80
%
%% MAIN is the main program for STOCHASTIC_RK_TEST.
%
%  Discussion:
%
%    STOCHASTIC_RK_TEST calls a set of problems for STOCHASTIC_RK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 June 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'STOCHASTIC_RK_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the STOCHASTIC_RK library.\n' );
 
  stochastic_rk_test01 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'STOCHASTIC_RK_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
   
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
