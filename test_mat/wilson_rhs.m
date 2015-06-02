function b = wilson_rhs ( )

%*****************************************************************************80
%
%% WILSON_RHS returns the Wilson right hand side.
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
  b(1:4,1) = [ 23.0; ...
               32.0; ...
               33.0; ...
               31.0 ];

  return
end
