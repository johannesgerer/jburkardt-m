function box_display_test ( )

%*****************************************************************************80
%
%% BOX_DISPLAY_TEST tests the BOX_DISPLAY library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 January 2014
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
  box_display_test05 ( );
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



