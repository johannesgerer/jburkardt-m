function q = p02_q ( m, c, w )

%*****************************************************************************80
%
%% P02_Q evaluates the integral for problem p02.
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
  q = prod ( ...
            (   atan ( ( 1.0 - w(1:m) ) .* c(1:m) ) ...
              + atan (         w(1:m)   .* c(1:m) ) ...
            ) .* c(1:m) ...
          );

  return
end
