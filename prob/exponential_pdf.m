function pdf = exponential_pdf ( x, a, b )

%*****************************************************************************80
%
%% EXPONENTIAL_PDF evaluates the Exponential PDF.
%
%  Discussion:
%
%    PDF(X)(A,B) = ( 1 / B ) * EXP ( ( A - X ) / B )
%
%    The time interval between two Poisson events is a random
%    variable with the Exponential PDF.  The parameter B is the
%    average interval between events.
%
%    In another context, the Exponential PDF is related to
%    the Boltzmann distribution, which describes the relative
%    probability of finding a system, which is in thermal equilibrium
%    at absolute temperature T, in a given state having energy E.
%    The relative probability is
%
%      Boltzmann_Relative_Probability(E,T) = exp ( - E / ( k * T ) ),
%
%    where k is the Boltzmann constant,
%
%      k = 1.38 * 10**(-23) joules / degree Kelvin
%
%    and normalization requires a determination of the possible
%    energy states of the system.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%    A <= X
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 < B.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x < a )
    pdf = 0.0;
  else
    pdf = ( 1.0 / b ) * exp ( ( a - x ) / b );
  end

  return
end
