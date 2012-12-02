function correlation_test ( )

%*****************************************************************************80
%
%% CORRELATION_TEST tests the CORRELATION library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CORRELATION_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the CORRELATION library.\n' );

  correlation_test01 ( );
  correlation_test02 ( );
  correlation_test03 ( );
  correlation_test04 ( );
  correlation_test05 ( );
  correlation_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CORRELATION_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



