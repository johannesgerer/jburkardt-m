function [ x, know ] = p00_sol ( problem, m, know )

%*****************************************************************************80
%
%% P00_SOL returns known solutions for a problem specified by index.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem index.
%
%    Input, integer M, the order of the problem.
%
%    Input/output, integer KNOW.
%    On input, KNOW is 0, or the index of the previously returned solution.
%    On output, KNOW is 0 if there are no more solutions, or it is the
%    index of the next solution.
%
%    Output, real X(M), the solution.
%
  if ( problem == 1 )
    [ x, know ] = p01_sol ( m, know );
  elseif ( problem == 2 )
    [ x, know ] = p02_sol ( m, know );
  elseif ( problem == 3 )
    [ x, know ] = p03_sol ( m, know );
  elseif ( problem == 4 )
    [ x, know ] = p04_sol ( m, know );
  elseif ( problem == 5 )
    [ x, know ] = p05_sol ( m, know );
  elseif ( problem == 6 )
    [ x, know ] = p06_sol ( m, know );
  elseif ( problem == 7 )
    [ x, know ] = p07_sol ( m, know );
  elseif ( problem == 8 )
    [ x, know ] = p08_sol ( m, know );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_SOL - Fatal error!\n' );
    fprintf ( 1, '  Problem index out of bounds.\n' );
    error ( 'P00_SOL - Fatal error!' );
  end

  return
end
