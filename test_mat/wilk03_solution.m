function x = wilk03_solution ( )

%*****************************************************************************80
%
%% WILK03_SOLUTION returns the solution of the WILK03 linear system.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real X(3,1), the solution of the linear system.
%
  x(1:3,1) = [ 0.0; ...
               4.0E+10 / 9.0; ...
               1.0E+10 ];

  return
end
