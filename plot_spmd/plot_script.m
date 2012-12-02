%% PLOT_SCRIPT is a script to call PLOT_FUN.
%
%  Discussion:
%
%    The BATCH command runs scripts, not functions.  So we have to write
%    this short script if we want to work with BATCH!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 March 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PLOT_SCRIPT\n' );
  fprintf ( 1, '  Form plot using multiple workers\n' );

  [ X, Y ] = plot_fun ( );
