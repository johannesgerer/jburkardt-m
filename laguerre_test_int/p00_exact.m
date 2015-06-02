function exact = p00_exact ( problem )

%*****************************************************************************80
%
%% P00_EXACT returns the exact integral for any problem.
%
%  Discussion:
%
%    This routine provides a "generic" interface to the exact integral
%    routines for the various problems, and allows a problem to be called
%    by index (PROBLEM) rather than by name.
%
%    In most cases, the "exact" value of the integral is not given;
%    instead a "respectable" approximation is available.
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
%    Output, real EXACT, the exact value of the integral.
%
  if ( problem == 1 )
    exact = p01_exact ( );
  elseif ( problem == 2 )
    exact = p02_exact ( );
  elseif ( problem == 3 )
    exact = p03_exact ( );
  elseif ( problem == 4 )
    exact = p04_exact ( );
  elseif ( problem == 5 )
    exact = p05_exact ( );
  elseif ( problem == 6 )
    exact = p06_exact ( );
  elseif ( problem == 7 )
    exact = p07_exact ( );
  elseif ( problem == 8 )
    exact = p08_exact ( );
  elseif ( problem == 9 )
    exact = p09_exact ( );
  elseif ( problem == 10 )
    exact = p10_exact ( );
  elseif ( problem == 11 )
    exact = p11_exact ( );
  elseif ( problem == 12 )
    exact = p12_exact ( );
  elseif ( problem == 13 )
    exact = p13_exact ( );
  elseif ( problem == 14 )
    exact = p14_exact ( );
  elseif ( problem == 15 )
    exact = p15_exact ( );
  elseif ( problem == 16 )
    exact = p16_exact ( );
  elseif ( problem == 17 )
    exact = p17_exact ( );
  elseif ( problem == 18 )
    exact = p18_exact ( );
  elseif ( problem == 19 )
    exact = p19_exact ( );
  elseif ( problem == 20 )
    exact = p20_exact ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_EXACT - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', problem );
    error ( 'P00_EXACT - Fatal error!' );
  end

  return
end
