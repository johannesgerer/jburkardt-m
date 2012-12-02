function box_display_test ( )

%*****************************************************************************80
%
%% BOX_DISPLAY_TEST tests BOX_DISPLAY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 March 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BOX_DISPLAY_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the BOX_DISPLAY library.\n' );

  box_display_test01 ( );
  box_display_test02 ( );
  box_display_test03 ( );
  box_display_test04 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BOX_DISPLAY_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



