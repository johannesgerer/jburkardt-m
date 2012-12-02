function a = tmat_init ( )

%*****************************************************************************80
%
%% TMAT_INIT initializes the geometric transformation matrix.
%
%  Discussion:
%
%    The geometric transformation matrix can be thought of as a 4 by 4
%    matrix "A" having components:
%
%      r11 r12 r13 t1
%      r21 r22 r23 t2
%      r31 r32 r33 t3
%        0   0   0  1
%
%    This matrix encodes the rotations, scalings and translations that
%    are applied to graphical objects.
%
%    A point P = (x,y,z) is rewritten in "homogeneous coordinates" as
%    PH = (x,y,z,1).  Then to apply the transformations encoded in A to
%    the point P, we simply compute A * PH.
%
%    Individual transformations, such as a scaling, can be represented
%    by simple versions of the transformation matrix.  If the matrix
%    A represents the current set of transformations, and we wish to
%    apply a new transformation B, then the original points are
%    transformed twice:  B * ( A * PH ).  The new transformation B can
%    be combined with the original one A, to give a single matrix C that
%    encodes both transformations: C = B * A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Foley, van Dam, Feiner, Hughes,
%    Computer Graphics, Principles and Practice,
%    Addison Wesley, Second Edition, 1990.
%
%  Parameters:
%
%    Input, real A(4,4), the geometric transformation matrix.
%
  a(1:4,1:4) = 0.0;

  for i = 1 : 4
    a(i,i) = 1.0;
  end

  return
end
