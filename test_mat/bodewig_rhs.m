function b = bodewig_rhs ( )

%*****************************************************************************80
%
%% BODEWIG_RHS returns the BODEWIG right hand side.
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
%    Output, real B(4,1), the right hand side vector.
%
  b(1:4,1) = [ 29.0, 18.0, 15.0, 4.0 ];

  return
end
