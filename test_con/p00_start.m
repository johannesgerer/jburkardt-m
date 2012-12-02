function x = p00_start ( problem, option, nvar )

%*****************************************************************************80
%
%% P00_START returns a starting point for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%   14 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem index.
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Output, real X(NVAR), the starting point.
%
  if ( problem == 1 )
    x = p01_start ( option, nvar );
  elseif ( problem == 2 )
    x = p02_start ( option, nvar );
  elseif ( problem == 3 )
    x = p03_start ( option, nvar );
  elseif ( problem == 4 )
    x = p04_start ( option, nvar );
  elseif ( problem == 5 )
    x = p05_start ( option, nvar );
  elseif ( problem == 6 )
    x = p06_start ( option, nvar );
  elseif ( problem == 7 )
    x = p07_start ( option, nvar );
  elseif ( problem == 8 )
    x = p08_start ( option, nvar );
  elseif ( problem == 9 )
    x = p09_start ( option, nvar );
  elseif ( problem == 10 )
    x = p10_start ( option, nvar );
  elseif ( problem == 11 )
    x = p11_start ( option, nvar );
  elseif ( problem == 12 )
    x = p12_start ( option, nvar );
  elseif ( problem == 13 )
    x = p13_start ( option, nvar );
  elseif ( problem == 14 )
    x = p14_start ( option, nvar );
  elseif ( problem == 15 )
    x = p15_start ( option, nvar );
  elseif ( problem == 16 )
    x = p16_start ( option, nvar );
  elseif ( problem == 17 )
    x = p17_start ( option, nvar );
  elseif ( problem == 18 )
    x = p18_start ( option, nvar );
  elseif ( problem == 19 )
    x = p19_start ( option, nvar );
  elseif ( problem == 20 )
    x = p20_start ( option, nvar );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_START - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized problem = %d\n', problem );
    error ( 'P00_START - Fatal error!' );
  end

  return
end
