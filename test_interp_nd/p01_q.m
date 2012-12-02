function q = p01_q ( m, c, w )

%*****************************************************************************80
%
%% P01_Q evaluates the integral for problem p01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Alan Genz,
%    A Package for Testing Multiple Integration Subroutines,
%    in Numerical Integration: Recent Developments, Software
%    and Applications,
%    edited by Patrick Keast and Graeme Fairweather,
%    Reidel, 1987, pages 337-340,
%    ISBN: 9027725144,
%    LC: QA299.3.N38.
%
%  Parameters:
%
%    Input, integer M, the dimension of the argument.
%
%    Input, real C(M), W(M), the problem parameters.
%
%    Output, real Q, the integral.
%
  q = 2.0 ^ m * ...
    cos ( 2.0 * pi * w(1) + 0.5 * sum ( c(1:m) ) ) * ...
    prod ( sin ( 0.5 * c(1:m) ) ./ c(1:m) );

  return
end
