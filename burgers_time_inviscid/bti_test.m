function bti_test ( )

%*****************************************************************************80
%
%% BTI_TEST tests BURGERS_TIME_INVISCID.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BTI_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the BURGERS_TIME_INVISCID library.\n' );

  bti_test01 ( );
  bti_test02 ( );
  bti_test03 ( );
  bti_test04 ( );
  bti_test05 ( );
  bti_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BTI_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
