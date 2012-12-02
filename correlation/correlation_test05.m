function correlation_test05 ( )

%*****************************************************************************80
%
%% CORRELATION_TEST05 calls CORRELATION_BROWNIAN_DISPLAY.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CORRELATION_TEST05\n' );
  fprintf ( 1, '  CORRELATION_BROWNIAN_DISPLAY displays the Brownian correlation\n' );

  correlation_brownian_display ( );

  filename = 'correlation_brownian_plots.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created "%s".\n', filename );

  return
end

