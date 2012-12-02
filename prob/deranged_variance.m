function variance = deranged_variance ( a )

%*****************************************************************************80
%
%% DERANGED_VARIANCE returns the variance of the Deranged CDF.
%
%  Discussion:
%
%    The variance is computed by straightforward summation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, the number of items.
%    1 <= A.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  mean = deranged_mean ( a );

  variance = 0.0;
  for x = 1 : a
    pdf = deranged_pdf ( x, a );
    variance = variance + pdf * ( x - mean )^2;
  end

  return
end
