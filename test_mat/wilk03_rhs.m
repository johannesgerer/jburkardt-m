function b = wilk03_rhs ( )

%*****************************************************************************80
%
%% WILK03_RHS returns the right hand side of the WILK03 linear system.
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
%    Output, real B(3,1), the right hand side of the system.
%
  b(1:3,1) = [ 0.0, 0.0, 1.0 ];

  return
end
