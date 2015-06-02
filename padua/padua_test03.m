function padua_test03 ( )

%*****************************************************************************80
%
%% PADUA_TEST03 tests PADUA_PLOT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PADUA_TEST03\n' );
  fprintf ( 1, '  PADUA_PLOT plots the Padua points.\n' );

  filename = 'padua_00.png';

  for l = 0 : 10
    padua_plot ( l, filename );
    filename = filename_inc ( filename );
  end

  return
end
