function alpha = p00_alpha ( problem )

%*****************************************************************************80
%
%% P00_ALPHA returns the value of ALPHA for any problem.
%
%  Discussion:
%
%    ALPHA is the lower, finite limit of integration in the integral.
%
%    The typical or default value is 0.0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the index of the problem.
%
%    Output, real ALPHA, the value of ALPHA.
%
  if ( problem == 1 )
    alpha = p01_alpha ( );
  elseif ( problem == 2 )
    alpha = p02_alpha ( );
  elseif ( problem == 3 )
    alpha = p03_alpha ( );
  elseif ( problem == 4 )
    alpha = p04_alpha ( );
  elseif ( problem == 5 )
    alpha = p05_alpha ( );
  elseif ( problem == 6 )
    alpha = p06_alpha ( );
  elseif ( problem == 7 )
    alpha = p07_alpha ( );
  elseif ( problem == 8 )
    alpha = p08_alpha ( );
  elseif ( problem == 9 )
    alpha = p09_alpha ( );
  elseif ( problem == 10 )
    alpha = p10_alpha ( );
  elseif ( problem == 11 )
    alpha = p11_alpha ( );
  elseif ( problem == 12 )
    alpha = p12_alpha ( );
  elseif ( problem == 13 )
    alpha = p13_alpha ( );
  elseif ( problem == 14 )
    alpha = p14_alpha ( );
  elseif ( problem == 15 )
    alpha = p15_alpha ( );
  elseif ( problem == 16 )
    alpha = p16_alpha ( );
  elseif ( problem == 17 )
    alpha = p17_alpha ( );
  elseif ( problem == 18 )
    alpha = p18_alpha ( );
  elseif ( problem == 19 )
    alpha = p19_alpha ( );
  elseif ( problem == 20 )
    alpha = p20_alpha ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_ALPHA - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', problem );
    error ( 'P00_ALPHA - Fatal error!' );
  end

  return
end
