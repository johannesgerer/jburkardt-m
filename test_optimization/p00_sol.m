function [ know, x ] = p09_sol ( problem, m, know )

%*****************************************************************************80
%
%% P00_SOL returns the solution for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem number.
%
%    Input, integer M, the spatial dimension.
%
%    Input/output, integer KNOW.
%    On input, KNOW is 0, or the index of the previously returned solution.
%    On output, KNOW is 0 if there are no more solutions, or it is the
%    index of the next solution.
%
%    Output, real X(M), the solution, if known.
%
  if ( problem == 1 )
    [ know, x ] = p01_sol ( m, know );
  elseif ( problem == 2 )
    [ know, x ] = p02_sol ( m, know );
  elseif ( problem == 3 )
    [ know, x ] = p03_sol ( m, know );
  elseif ( problem == 4 )
    [ know, x ] = p04_sol ( m, know );
  elseif ( problem == 5 )
    [ know, x ] = p05_sol ( m, know );
  elseif ( problem == 6 )
    [ know, x ] = p06_sol ( m, know );
  elseif ( problem == 7 )
    [ know, x ] = p07_sol ( m, know );
  elseif ( problem == 8 )
    [ know, x ] = p08_sol ( m, know );
  elseif ( problem == 9 )
    [ know, x ] = p09_sol ( m, know );
  elseif ( problem == 10 )
    [ know, x ] = p10_sol ( m, know );
  elseif ( problem == 11 )
    [ know, x ] = p11_sol ( m, know );
  elseif ( problem == 12 )
    [ know, x ] = p12_sol ( m, know );
  else
    fprintf ( 1, 'x\n' );
    fprintf ( 1, 'P00_SOL - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of PROBLEM =  %d\n', problem );
    error ( 'P00_SOL - Fatal error!' );
  end

  return
end
