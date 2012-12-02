function pi_test ( )

%*****************************************************************************80
%
%% PI_TEST tests methods for computing pi with variable precision arithmetic.
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
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PI_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test MATLAB''s variable precision arithmetic (VPA) facility\n' );
  fprintf ( 1, '  by computing PI.\n' );

  agm_pi_test ( );
  bbp_pi_test ( );
  chud_pi_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PI_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



