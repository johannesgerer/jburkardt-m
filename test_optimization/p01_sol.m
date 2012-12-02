function [ know, x ] = p01_sol ( m, know )

%*****************************************************************************80
%
%% P01_SOL returns the solution for problem 01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2012
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
%    Output, real X(M,1), the solution, if known.
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
