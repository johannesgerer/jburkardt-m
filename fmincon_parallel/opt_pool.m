%% OPT_POOL uses the MATLABPOOL command to run the QUAD code.
%
%  Discussion:
%
%    Output printed by the function appears directly on the screen.
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
  fprintf ( 1, 'OPT_POOL\n' );
  fprintf ( 1, '  Solve optimization problem with discretization parameter N = %d\n', n );

  matlabpool open local 4

  [ z_star, PAR, exit ] = opt_fun ( @zermelo, n );

  matlabpool close
%
%  On successful conclusion, display the plot.
%
  if ( 0 <= exit && isfield ( PAR, 'plot' ) )
    feval ( PAR.plot, z_star, PAR )
  end
