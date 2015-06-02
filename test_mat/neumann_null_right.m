function x = neumann_null_right ( nrow, ncol )

%*****************************************************************************80
%
%% NEUMANN_NULL_RIGHT returns a right null vector of the NEUMANN matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 March 2015
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
%    Output, real X(NROW*NCOL,1), the null vector.
%
  n = nrow * ncol;
  x = ones ( n, 1 );
 
  return
end
