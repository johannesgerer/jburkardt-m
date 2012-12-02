%% OPT_SCRIPT is a script to call OPT_FUN.
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
%    31 March 2010
%
%  Author:
%
%    John Burkardt
%
  n = 16;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'OPT_SCRIPT\n' );
  fprintf ( 1, '  Optimization using discretization parameter of %d\n', n );

  [ z_star, PAR, exit ] = opt_fun ( @zermelo, n );
