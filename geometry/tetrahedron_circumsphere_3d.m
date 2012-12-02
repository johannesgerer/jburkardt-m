function [ r, center ] = tetrahedron_circumsphere_3d ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_CIRCUMSPHERE_3D computes the circumsphere of a tetrahedron in 3D.
%
%  Discussion:
%
%    The circumsphere, or circumscribed sphere, of a tetrahedron is the sphere that
%    passes through the four vertices.  The circumsphere is not necessarily
%    the smallest sphere that contains the tetrahedron.
%
%    Surprisingly, the diameter of the sphere can be found by solving
%    a 3 by 3 linear system.  This is because the vectors P2 - P1,
%    P3 - P1 and P4 - P1 are secants of the sphere, and each forms a
%    right triangle with the diameter through P1.  Hence, the dot product of
%    P2 - P1 with that diameter is equal to the square of the length
%    of P2 - P1, and similarly for P3 - P1 and P4 - P1.  This determines
%    the diameter vector originating at P1, and hence the radius and
%    center.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Adrian Bowyer and John Woodwark,
%    A Programmer's Geometry,
%    Butterworths, 1983.
%
%  Parameters:
%
%    Input, real TETRA(3,4) the tetrahedron vertices.
%
%    Output, real R, CENTER(3), the center of the
%    circumscribed sphere, and its radius.  If the linear system is
%    singular, then R = -1, CENTER(1:3) = 0.
%
  dim_num = 3;
  nrhs = 1;
%
%  Set up the linear system.
%
  a(1:dim_num,1:3) = ( tetra(1:dim_num,2:4) )';

  for j = 1 : dim_num
    a(1:dim_num,j) = a(1:dim_num,j) - tetra(j,1);
  end

  for i = 1 : dim_num
    a(i,4) = sum ( a(i,1:3).^2 );
  end
%
%  Solve the linear system.
%
  [ a, info ] = r8mat_solve ( dim_num, nrhs, a );
%
%  If the system was singular, return a consolation prize.
%
  if ( info ~= 0 )
    r = -1.0;
    center(1:dim_num) = 0.0;
    return
  end
%
%  Compute R, X, Y, Z.
%
  r = 0.5 * sqrt ( sum ( a(1:dim_num,dim_num+1).^2 ) );

  center(1:dim_num) = tetra(1:dim_num,1) + 0.5 * a(1:dim_num,dim_num+1);

  return
end
