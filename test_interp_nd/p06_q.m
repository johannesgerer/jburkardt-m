function q = p06_q ( m, c, w )

%*****************************************************************************80
%
%% P06_Q evaluates the integral for problem p06.
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

%
%  To simplify the calculation, force W(3:M) to be at least 1.0.
%
  w(3:m) = 1.0;

  q = 1.0;

  for i = 1 : m

    if ( w(i) <= 0.0 )

      q = q * 0.0;

    elseif ( w(i) <= 1.0 )

      if ( c(i) == 0.0 )
        q = q * w(i);
      else
        q = q * ( exp ( c(i) * w(i) ) - 1.0 ) / c(i);
      end

    else

      if ( c(i) ~= 0.0 )
        q = q * ( exp ( c(i) * w(i) ) - 1.0 ) / c(i);
      end

    end

  end

  return
end
