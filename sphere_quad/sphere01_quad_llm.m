function [ result, n ] = sphere01_quad_llm ( f, h )

%*****************************************************************************80
%
%% SPHERE01_QUAD_LLM: longitude/latitude grid plus midside rule.
%
%  Discussion:
%
%    The sphere is broken up into spherical triangles, whose sides
%    do not exceed the length H.  Then the function is evaluated
%    at the midsides, and the average is multiplied by the area.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, function v = F ( n, x ), evaluates the integrand.
%
%    Input, real H, the maximum length of a side of the spherical
%    quadrilaterals.
%
%    Output, real RESULT, the approximate integral.
%
%    Output, integer N, the number of points used.
%

%
%  Choose PHI and THETA counts that make short sides.
%
  phi_num = floor ( pi / h );

  if ( h * phi_num < pi )
    phi_num = phi_num + 1;
  end

  theta_num = floor ( 2.0 * pi / h );

  if ( h * theta_num < pi )
    theta_num = theta_num + 1;
  end

  n = 0;
  result = 0.0;
%
%  Only one THETA (and hence, only one PHI.)
%
  if ( theta_num == 1 )

    sphere_area = 4.0 * pi;

    theta = 0.0;
    phi = pi / 2.0;
    x = tp_to_xyz ( theta, phi );
    v = f ( 1, x );
    n = n + 1;
    result = sphere_area * v;
%
%  Several THETA's, one PHI.
%
  elseif ( phi_num == 1 )

    sphere_area = 4.0 * pi;
    sector_area = sphere_area / theta_num;

    result = 0.0;

    for j = 1 : theta_num

      theta = ( j - 1 ) * 2 * pi / theta_num;
      phi = pi / 2.0;
      x = tp_to_xyz ( theta, phi );
      v = f ( 1, x );
      n = n + 1;
      result = result + sector_area * v;

    end do
%
%  At least two PHI's.
%
  else

    result = 0.0;
%
%  Picture:
%
%        V1
%       /  \
%      /    \
%    V12----V22
%
    phi1 = 0.0;
    phi2 = pi / phi_num;

    for j = 1 : theta_num

      theta1 = ( j - 1 ) * 2.0 * pi / theta_num;
      theta2 = j * 2.0 * pi / theta_num;

      x1 = tp_to_xyz ( theta1, phi1 );
      x12 = tp_to_xyz ( theta1, phi2 );
      x22 = tp_to_xyz ( theta2, phi2 );

      area = sphere01_triangle_vertices_to_area ( x1, x12, x22 );

      [ m1, m2, m3 ] = sphere01_triangle_vertices_to_midpoints ( x1, x12, x22 );

      v = f ( 1, m1 );
      n = n + 1;
      result = result + area * v / 3.0;
      v = f ( 1, m2 );
      n = n + 1;
      result = result + area * v / 3.0;
      v = f ( 1, m3 );
      n = n + 1;
      result = result + area * v / 3.0;

    end
%
%  Picture:
%
%    V11--V21
%     | \  |
%     |  \ |
%    V12--V22
%
    for i = 2 : phi_num - 1

      phi1 = ( i - 1 ) * pi / phi_num;
      phi2 = i * pi / phi_num;

      for j = 1 : theta_num

        theta1 = ( j - 1 ) * 2.0 * pi / theta_num;
        theta2 = j * 2.0 * pi / theta_num;

        x11 = tp_to_xyz ( theta1, phi1 );
        x21 = tp_to_xyz ( theta2, phi1 );
        x12 = tp_to_xyz ( theta1, phi2 );
        x22 = tp_to_xyz ( theta2, phi2 );

        area = sphere01_triangle_vertices_to_area ( x11, x12, x22 );

        [ m1, m2, m3 ] = sphere01_triangle_vertices_to_midpoints ( x11, x12, x22 );

        v = f ( 1, m1 );
        n = n + 1;
        result = result + area * v / 3.0;
        v = f ( 1, m2 );
        n = n + 1;
        result = result + area * v / 3.0;
        v = f ( 1, m3 );
        n = n + 1;
        result = result + area * v / 3.0;

        area = sphere01_triangle_vertices_to_area ( x22, x21, x11 );

        [ m1, m2, m3 ] = sphere01_triangle_vertices_to_midpoints ( x22, x21, x11 );

        v = f ( 1, m1 );
        n = n + 1;
        result = result + area * v / 3.0;
        v = f ( 1, m2 );
        n = n + 1;
        result = result + area * v / 3.0;
        v = f ( 1, m3 );
        n = n + 1;
        result = result + area * v / 3.0;

      end

    end
%
%  Picture:
%
%    V11----V21
%      \    /
%       \  /
%        V2
%
    phi1 = ( phi_num - 1 ) * pi / phi_num;
    phi2 = pi;

    for j = 1 : theta_num

      theta1 = ( j - 1 ) * 2.0 * pi / theta_num;
      theta2 = j * 2.0 * pi / theta_num;

      x11 = tp_to_xyz ( theta1, phi1 );
      x21 = tp_to_xyz ( theta2, phi1 );
      x2 = tp_to_xyz ( theta2, phi2 );

      area = sphere01_triangle_vertices_to_area ( x11, x2, x21 );

      [ m1, m2, m3 ] = sphere01_triangle_vertices_to_midpoints ( x11, x2, x21 );

      v = f ( 1, m1 );
      n = n + 1;
      result = result + area * v / 3.0;
      v = f ( 1, m2 );
      n = n + 1;
      result = result + area * v / 3.0;
      v = f ( 1, m3 );
      n = n + 1;
      result = result + area * v / 3.0;

    end

  end

  return
end
