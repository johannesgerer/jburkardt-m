function heat_oned_test ( )

%*****************************************************************************80
%
%% HEAT_ONED_TEST tests the HEAT_ONED library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 December 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HEAT_ONED_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the HEAT_ONED library.\n' );

  heat_oned_test01 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HEAT_ONED_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  timestamp ( );

  return
end
