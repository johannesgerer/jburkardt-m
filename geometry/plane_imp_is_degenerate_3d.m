function value = plane_imp_is_degenerate_3d ( a, b, c )

%*****************************************************************************80
%
%% PLANE_IMP_IS_DEGENERATE_3D is TRUE if an implicit plane is degenerate.
%
%  Discussion:
%
%    The implicit form of a plane in 3D is:
%
%      A * X + B * Y + C * Z + D = 0
%
%    The implicit plane is degenerate if A = B = C = 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, the implicit plane parameters.
%
%    Output, logical VALUE, is TRUE if the plane is degenerate.
%
  if ( a == 0.0 & b == 0.0 & c == 0.0 )
    value = 1;
  else
    value = 0;
  end

  return
end
