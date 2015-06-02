function b = wilk04_rhs ( )

%*****************************************************************************80
%
%% WILK04_RHS returns the right hand side of the WILK04 linear system.
%
%  Formula:
%
%    0.6524
%    0.3127
%    0.4186
%    0.7853
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
%    Output, real B(4,1), the right hand side of the system.
%
  b(1:4,1) = [ 0.6524; ...
               0.3127; ...
               0.4186; ...
               0.7853 ];

  return
end
