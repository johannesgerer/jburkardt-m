function [ h, hmin, hmax ] = p00_stepsize ( problem, option );

%*****************************************************************************80
%
%% P00_STEPSIZE returns step sizes for any problem.
%
%  Discussion:
%
%    The routine returns a suggested initial stepsize, and suggestions for
%    the minimum and maximum stepsizes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2008
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
%    Output, real H, HMIN, HMAX, suggested values for the
%    initial step, the minimum step, and the maximum step.
%
  if ( problem == 1 )
    [ h, hmin, hmax ] = p01_stepsize ( option );
  elseif ( problem == 2 )
    [ h, hmin, hmax ] = p02_stepsize ( option );
  elseif ( problem == 3 )
    [ h, hmin, hmax ] = p03_stepsize ( option );
  elseif ( problem == 4 )
    [ h, hmin, hmax ] = p04_stepsize ( option );
  elseif ( problem == 5 )
    [ h, hmin, hmax ] = p05_stepsize ( option );
  elseif ( problem == 6 )
    [ h, hmin, hmax ] = p06_stepsize ( option );
  elseif ( problem == 7 )
    [ h, hmin, hmax ] = p07_stepsize ( option );
  elseif ( problem == 8 )
    [ h, hmin, hmax ] = p08_stepsize ( option );
  elseif ( problem == 9 )
    [ h, hmin, hmax ] = p09_stepsize ( option );
  elseif ( problem == 10 )
    [ h, hmin, hmax ] = p10_stepsize ( option );
  elseif ( problem == 11 )
    [ h, hmin, hmax ] = p11_stepsize ( option );
  elseif ( problem == 12 )
    [ h, hmin, hmax ] = p12_stepsize ( option );
  elseif ( problem == 13 )
    [ h, hmin, hmax ] = p13_stepsize ( option );
  elseif ( problem == 14 )
    [ h, hmin, hmax ] = p14_stepsize ( option );
  elseif ( problem == 15 )
    [ h, hmin, hmax ] = p15_stepsize ( option );
  elseif ( problem == 16 )
    [ h, hmin, hmax ] = p16_stepsize ( option );
  elseif ( problem == 17 )
    [ h, hmin, hmax ] = p17_stepsize ( option );
  elseif ( problem == 18 )
    [ h, hmin, hmax ] = p18_stepsize ( option );
  elseif ( problem == 19 )
    [ h, hmin, hmax ] = p19_stepsize ( option );
  elseif ( problem == 20 )
    [ h, hmin, hmax ] = p20_stepsize ( option );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_STEPSIZE - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized problem number = %d\n', problem );
    error ( 'P00_STEPSIZE - Fatal error!' );
  end

  return
end
