function t = p00_vertices ( problem )

%*****************************************************************************80
%
%% P00_VERTICES returns the vertices for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 April 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem number.
%
%    Output, real T(2,3), the vertices.
%
  if ( problem == 1 )
    t = p01_vertices ( );
  elseif ( problem == 2 )
    t = p02_vertices ( );
  elseif ( problem == 3 )
    t = p03_vertices ( );
  elseif ( problem == 4 )
    t = p04_vertices ( );
  elseif ( problem == 5 )
    t = p05_vertices ( );
  elseif ( problem == 6 )
    t = p06_vertices ( );
  elseif ( problem == 7 )
    t = p07_vertices ( );
  elseif ( problem == 8 )
    t = p08_vertices ( );
  elseif ( problem == 9 )
    t = p09_vertices ( );
  elseif ( problem == 10 )
    t = p10_vertices ( );
  elseif ( problem == 11 )
    t = p11_vertices ( );
  elseif ( problem == 12 )
    t = p12_vertices ( );
  elseif ( problem == 13 )
    t = p13_vertices ( );
  elseif ( problem == 14 )
    t = p14_vertices ( );
  elseif ( problem == 15 )
    t = p15_vertices ( );
  elseif ( problem == 16 )
    t = p16_vertices ( );
  elseif ( problem == 17 )
    t = p17_vertices ( );
  elseif ( problem == 18 )
    t = p18_vertices ( );
  elseif ( problem == 19 )
    t = p19_vertices ( );
  elseif ( problem == 20 )
    t = p20_vertices ( );
  elseif ( problem == 21 )
    t = p21_vertices ( );
  elseif ( problem == 22 )
    t = p22_vertices ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_VERTICES - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', problem );
    error ( 'P00_VERTICES - Fatal error!' );
  end

  return
end
