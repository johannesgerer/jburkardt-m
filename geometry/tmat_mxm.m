function c = tmat_mxm ( a, b )

%*****************************************************************************80
%
%% TMAT_MXM multiplies two geometric transformation matrices.
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
%    Input, real A(4,4), the first geometric transformation matrix.
%
%    Input, real B(4,4), the second geometric transformation
%    matrix.
%
%    Output, real C(4,4), the product A * B.
%
  c(1:4,1:4) = a(1:4,1:4) * b(1:4,1:4);

  return
end
