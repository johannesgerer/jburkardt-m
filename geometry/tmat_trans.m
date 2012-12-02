function b = tmat_trans ( a, t )

%*****************************************************************************80
%
%% TMAT_TRANS applies a translation to the geometric transformation matrix.
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
%    Input, real A(4,4), the current geometric transformation
%    matrix.
%
%    Input, real T(3), the translation.  This may be thought
%    of as the point that the origin moves to under the translation.
%
%    Output, real B(4,4), the modified transformation matrix.
%
  b(1:4,1:4) = a(1:4,1:4);

  b(1:3,4) = b(1:3,4) + t(1:3)';

  return
end
