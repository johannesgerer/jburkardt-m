function x = neumann_null ( nrow, ncol )

%*****************************************************************************80
%
%% NEUMANN_NULL returns a null vector of the Neumann matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NROW, NCOL, the number of rows and columns 
%    in the grid.
%
%    Output, real X(NROW*NCOL), the null vector.
%
  x(1:nrow*ncol) = 1.0;

  return
end
