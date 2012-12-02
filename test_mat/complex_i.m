function a = complex_i ( )

%*****************************************************************************80
%
%% COMPLEX_I returns a 2 by 2 matrix that behaves like the imaginary unit.
%
%  Formula:
%
%    0 1
%   -1 0
%
%  Properties:
%
%    A is integral: int ( A ) = A.
%
%    A is anti-involutional: A * A = - I
%
%    A * A * A * A = I
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real A(2,2), the matrix.
%
  a(1,1) =  0.0;
  a(1,2) =  1.0;
  a(2,1) = -1.0;
  a(2,2) =  0.0;

  return
end
