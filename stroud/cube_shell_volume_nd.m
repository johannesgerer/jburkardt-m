function value = cube_shell_volume_nd ( n, r1, r2 )

%*****************************************************************************80
%
%% CUBE_SHELL_VOLUME_ND computes the volume of a cubic shell in ND.
%
%  Integration region:
%
%    Points X(1:N) such that:
%
%      R1 <= ABS ( X(1:N) ) <= R2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the space.
%
%    Input, real R1, R2, the inner and outer radii of the cubic
%    shell.  The outer cube is of side 2*R2, the inner, missing cube of side
%    2*R1.
%
%    Output, real VALUE, the volume of the cubic
%    shell.
%
  value = ( r2^n - r1^n ) * 2^n;

  return
end
