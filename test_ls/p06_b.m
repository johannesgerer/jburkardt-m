function b = p06_b ( m )

%*****************************************************************************80
%
%% P06_B returns the right hand side B for problem 6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of equations.
%
%    Output, real B(M,1), the right hand side.
%
  b(1,1) = 1.0;
  b(2:m,1) = 0.0;

  return
end
