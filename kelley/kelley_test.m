function kelley_test ( )

%*****************************************************************************80
%
%% KELLEY_TEST tests KELLEY.
%
%  Modified:
%
%    24 June 2007
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'KELLEY_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the KELLEY library.\n' );

  kelley_test01 ( );
  kelley_test02Ê( );
  kelley_test03 ( );
  kelley_test04 ( );
  kelley_test05 ( );
  kelley_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'KELLEY_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end


