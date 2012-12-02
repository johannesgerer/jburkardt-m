function variance = geometric_variance ( a )

%*****************************************************************************80
%
%% GEOMETRIC_VARIANCE returns the variance of the Geometric PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, the probability of success on one trial.
%    0.0 <= A <= 1.0.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  variance = ( 1.0 - a ) / ( a * a );

  return
end
