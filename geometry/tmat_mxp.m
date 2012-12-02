function y = tmat_mxp ( a, x )

%*****************************************************************************80
%
%% TMAT_MXP multiplies a geometric transformation matrix times a point.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 February 2005
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
%    Input, real X(3), the point to be multiplied.  The fourth
%    component of X is implicitly assigned the value of 1.
%
%    Output, real Y(3), the result of A*X.  The product is
%    accumulated in a temporary vector, and then assigned to the result.
%    Therefore, it is legal for X and Y to share memory.
%
  y(1:3) = a(1:3,4) + a(1:3,1:3) * x(1:3);

  return
end
