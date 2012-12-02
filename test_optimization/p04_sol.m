function [ know, x ] = p04_sol ( m, know )

%*****************************************************************************80
%
%% P04_SOL returns the solution for problem 04.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
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
  if ( know == 0 )
    know = 1;
    x(1:m,1) = 1.0;
  else
    know = 0;
    x(1:m,1) = 0.0;
  end

  return
end
