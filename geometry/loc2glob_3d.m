function glopts = loc2glob_3d ( cospitch, cosroll, cosyaw, sinpitch, sinroll, ...
  sinyaw, globas, locpts )

%*****************************************************************************80
%
%% LOC2GLOB_3D converts from a local to global coordinate system in 3D.
%
%  Discussion:
%
%    A global coordinate system is given.
%
%    A local coordinate system has been translated to the point with
%    global coordinates GLOBAS, and rotated through a yaw, a pitch, and
%    a roll.
%
%    A point has local coordinates LOCPTS, and it is desired to know
%    the point's global coordinates GLOPTS.
%
%    The transformation may be written as
%
%      GLOB = GLOBAS + N_YAW * N_PITCH * N_ROLL * LOC
%
%    where
%
%               (  cos(Yaw)   -sin(Yaw)        0      )
%    N_YAW    = (  sin(Yaw)    cos(Yaw)        0      )
%               (      0           0           1      )
%
%               (  cos(Pitch)      0       sin(Pitch) )
%    N_PITCH =  (      0           1           0      )
%               ( -sin(Pitch)      0       cos(Pitch) )
%
%               (      1           0           0      )
%    N_ROLL =   (      0       cos(Roll)  -sin(Roll)  )
%               (      0       sin(Roll)   cos(Roll)  )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real COSPITCH, COSROLL, COSYAW, the cosines of the
%    pitch, roll and yaw angles.
%
%    Input, real SINPITCH, SINROLL, SINYAW, the sines of the pitch,
%    roll and yaw angles.
%
%    Input, real GLOBAS(3,1), the global coordinates of the base
%    vector.
%
%    Input, real LOCPTS(3,1), the local coordinates of the point.
%
%    Output, real GLOPTS(3,1), the global coordinates of the point.
%
  glopts(1,1) = globas(1,1) + (  cosyaw * cospitch ) * locpts(1,1) ...
    + (  cosyaw * sinpitch * sinroll - sinyaw * cosroll ) * locpts(2,1) ...
    + (  cosyaw * sinpitch * cosroll + sinyaw * sinroll ) * locpts(3,1);

  glopts(2,1) = globas(2,1) + (  sinyaw * cospitch ) * locpts(1,1) ...
    + (  sinyaw * sinpitch * sinroll + cosyaw * cosroll ) * locpts(2,1) ...
    + (  sinyaw * sinpitch * cosroll - cosyaw * sinroll ) * locpts(3,1);

  glopts(3,1) = globas(3,1) + ( -sinpitch ) * locpts(1,1) ...
    + (  cospitch * sinroll ) * locpts(2,1) ...
    + (  cospitch * cosroll ) * locpts(3,1);

  return
end
