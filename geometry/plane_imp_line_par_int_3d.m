function [ intersect, p ] = plane_imp_line_par_int_3d ( a, b, c, d, x0, y0, z0, ...
  f, g, h )

%*****************************************************************************80
%
%% PLANE_IMP_LINE_PAR_INT_3D: intersection ( implicit plane, parametric line ) in 3D.
%
%  Discussion:
%
%    The implicit form of a plane in 3D is:
%
%      A * X + B * Y + C * Z + D = 0
%
%    The parametric form of a line in 3D is:
%
%      X = X0 + F * T
%      Y = Y0 + G * T
%      Z = Z0 + H * T
%
%    We normalize by choosing F*F+G*G+H*H=1 and 0 <= F.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Adrian Bowyer and John Woodwark,
%    A Programmer's Geometry,
%    Butterworths, 1983, page 111.
%
%  Parameters:
%
%    Input, real A, B, C, D, the implicit plane parameters.
%
%    Input, real X0, Y0, Z0, F, G, H, parameters that define the
%    parametric line.
%
%    Output, logical INTERSECT, is TRUE if the line and the plane
%    intersect.
%
%    Output, real P(3), is a point of intersection of the line
%    and the plane, if INTERSECT is TRUE.
%
  dim_num = 3;
  tol = 0.00001;
%
%  Check.
%
  norm1 = sqrt ( a * a + b * b + c * c );

  if ( norm1 == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PLANE_IMP_LINE_PAR_INT_3D - Fatal error!\n' );
    fprintf ( 1, '  The plane normal vector is null.\n' );
    error ( 'PLANE_IMP_LINE_PAR_INT_3D - Fatal error!' )
  end

  norm2 = sqrt ( f * f + g * g + h * h );

  if ( norm2 == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PLANE_IMP_LINE_PAR_INT_3D - Fatal error!\n' );
    fprintf ( 1, '  The line direction vector is null.\n' );
    error ( 'PLANE_IMP_LINE_PAR_INT_3D - Fatal error!' )
  end

  denom = a * f + b * g + c * h;
%
%  The line and the plane may be parallel.
%
  if ( abs ( denom ) < tol * norm1 * norm2 )

    if ( a * x0 + b * y0 + c * z0 + d == 0.0 )
      intersect = 1;
      p(1) = x0;
      p(2) = y0;
      p(3) = z0;
    else
      intersect = 0;
      p(1:dim_num) = 0.0;
    end
%
%  If they are not parallel, they must intersect.
%
  else

    intersect = 1;
    t = - ( a * x0 + b * y0 + c * z0 + d ) / denom;
    p(1) = x0 + t * f;
    p(2) = y0 + t * g;
    p(3) = z0 + t * h;

  end

  return
end
