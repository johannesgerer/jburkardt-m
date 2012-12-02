function locpts = glob2loc_3d ( cospitch, cosroll, cosyaw, sinpitch, ...
  sinroll, sinyaw, globas, glopts )

%*****************************************************************************80
%
%% GLOB2LOC_3D converts from a global to a local coordinate system in 3D.
%
%  Discussion:
%
%    A global coordinate system is given.
%
%    A local coordinate system has been translated to the point with
%    global coordinates GLOBAS, and rotated through a yaw, a pitch, and
%    a roll.
%
%    A point has global coordinates GLOPTS, and it is desired to know
%    the point's local coordinates LOCPTS.
%
%    The transformation may be written as
%
%      LOC = M_ROLL * M_PITCH * M_YAW * ( GLOB - GLOBAS )
%
%    where
%
%               (       1            0            0      )
%    M_ROLL =   (       0        cos(Roll)    sin(Roll)  )
%               (       0      - sin(Roll)    cos(Roll)  )
%
%               (   cos(Pitch)       0      - sin(Pitch) )
%    M_PITCH =  (       0            1            0      )
%               (   sin(Pitch)       0        cos(Pitch) )
%
%               (   cos(Yaw)     sin(Yaw)         0      )
%    M_YAW    = ( - sin(Yaw)     cos(Yaw)         0      )
%               (       0            0            1      )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real COSPITCH, COSROLL, COSYAW, the cosines of
%    the pitch, roll and yaw angles.
%
%    Input, real SINPITCH, SINROLL, SINYAW, the sines of the pitch,
%    roll and yaw angles.
%
%    Input, real GLOBAS(3), the X, Y, and Z coordinates of the
%    global base vector.
%
%    Input, real GLOPTS(3), the global ( X, Y and Z ) coordinates
%    of the point whose coordinates are to be transformed.
%
%    Output, real LOCPTS(3), the local coordinates of the point
%    whose global coordinates were given in GLOPTS.
%
  locpts(1) = ( cosyaw * cospitch ) * ( glopts(1) - globas(1) ) ...
            + ( sinyaw * cospitch ) * ( glopts(2) - globas(2) ) ...
            -   sinpitch            * ( glopts(3) - globas(3) );

  locpts(2) = ( cosyaw * sinpitch * sinroll - sinyaw * cosroll ) ...
    * ( glopts(1) - globas(1) ) ...
    + ( sinyaw * sinpitch * sinroll + cosyaw * cosroll ) ...
    * ( glopts(2) - globas(2) ) ...
    +   cospitch * sinroll * ( glopts(3) - globas(3) );

  locpts(3) = ( cosyaw * sinpitch * cosroll + sinyaw * sinroll ) ...
    * ( glopts(1) - globas(1) ) ...
    + ( sinyaw * sinpitch * cosroll - cosyaw * sinroll  ) ...
    * ( glopts(2) - globas(2) ) ...
    + ( cospitch * cosroll ) * ( glopts(3) - globas(3) );

  return
end
