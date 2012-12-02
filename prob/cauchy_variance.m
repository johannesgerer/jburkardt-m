function variance = cauchy_variance ( a, b )

%*****************************************************************************80
%
%% CAUCHY_VARIANCE returns the variance of the Cauchy PDF.
%
%  Discussion:
%
%    The variance of the Cauchy PDF is not well defined.  This routine
%    is made available for completeness only, and simply returns
%    a "very large" number.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 < B.
%
%    Output, real VARIANCE, the mean of the PDF.
%
  variance = r8_huge ( );

  return
end

