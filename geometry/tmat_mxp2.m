function y = tmat_mxp2 ( a, n, x )

%*****************************************************************************80
%
%% TMAT_MXP2 multiplies a geometric transformation matrix times N points.
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
%    Input, integer N, the number of points to be multiplied.
%
%    Input, real X(3,N), the points to be multiplied.
%
%    Output, real Y(3,N), the transformed points.  Each product is
%    accumulated in a temporary vector, and then assigned to the
%    result.  Therefore, it is legal for X and Y to share memory.
%
  for k = 1 : n
    y(1:3,k) = a(1:3,4) + a(1:3,1:3) * x(1:3,k);
  end

  return
end
