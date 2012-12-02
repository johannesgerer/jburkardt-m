function [ p, q ] = cfrac_to_rat ( n, a )

%*****************************************************************************80
%
%% CFRAC_TO_RAT converts a monic continued fraction to an ordinary fraction.
%
%  Discussion:
%
%    The routine is given the monic or "simple" continued fraction with
%    integer coefficients:
%
%      A(1) + 1 / ( A(2) + 1 / ( A(3) ... + 1 / A(N) ) )
%
%    and returns the N successive approximants P(I)/Q(I)
%    to the value of the rational number represented by the continued
%    fraction, with the value exactly equal to the final ratio P(N)/Q(N).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Hart, Cheney, Lawson, Maehly, Mesztenyi, Rice, Thacher, Witzgall,
%    Computer Approximations,
%    Wiley, 1968.
%
%  Parameters:
%
%    Input, integer N, the number of continued fraction coefficients.
%
%    Input, integer A(N), the continued fraction coefficients.
%
%    Output, integer P(N), Q(N), the N successive approximations
%    to the value of the continued fraction.
%
  for i = 1 : n

    if ( i == 1 )
      p(i) = a(i) * 1 + 0;
      q(i) = a(i) * 0 + 1;
    elseif ( i == 2 )
      p(i) = a(i) * p(i-1) + 1;
      q(i) = a(i) * q(i-1) + 0;
    else
      p(i) = a(i) * p(i-1) + p(i-2);
      q(i) = a(i) * q(i-1) + q(i-2);
    end

  end

  return
end
