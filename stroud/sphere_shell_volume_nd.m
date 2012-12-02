function value = sphere_shell_volume_nd ( n, r1, r2 )

%*****************************************************************************80
%
%% SPHERE_SHELL_VOLUME_ND computes the volume of a spherical shell in ND.
%
%  Integration region:
%
%    Points X(1:N) such that:
%
%      R1**2 <= Sum ( X(1:N) - XC(1:N) )**2 <= R2**2.
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
%    Input, real R1, R2, the radiuses of the inner and
%    outer spheres.
%
%    Output, real SPHERE_SHELL_VOLUME_ND, the volume of the
%    spherical shell.
%
  value = ball_volume_nd ( n, r2 ) - ball_volume_nd ( n, r1 );

  return
end
