function q = p05_q ( m, c, w )

%*****************************************************************************80
%
%% P05_Q evaluates the integral for problem p05.
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
  q = 1.0;

  for i = 1 : m
%
%  W < 0 < 1
%
%  | X - W | = X - W from 0 to 1.
%
    if ( w(i) < 0.0 )

      q = q * ...
        ( exp ( - c(i) * (     - w(i) ) ) ...
        - exp ( - c(i) * ( 1.0 - w(i) ) ) ) / c(i);
%
%  0 < W < 1
%
%  | X - W | = W - X from 0 to Z, 
%            = X - W from      Z to 1.
%
    elseif ( w(i) < 1.0 )

      q = q * ( 2.0 ...
        - exp ( - c(i) * (       w(i) ) ) ...
        - exp ( - c(i) * ( 1.0 - w(i) ) ) ) / c(i);
%
%  0 < 1 < W
%
%  | X - W | = W - X from 0 to 1.
%
    else

      q = q * ...
        ( exp ( - c(i) * ( w(i) - 1.0 ) ) ...
        - exp ( - c(i) * ( w(i)           ) ) ) / c(i);

    end

  end

  return
end
