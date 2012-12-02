function cdf = zipf_cdf ( x, a )

%*****************************************************************************80
%
%% ZIPF_CDF evaluates the Zipf CDF.
%
%  Discussion:
%
%    Simple summation is used.
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
%    Input, integer X, the argument of the PDF.
%    1 <= N
%
%    Input, real A, the parameter of the PDF.
%    1.0 < A.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x < 1 )

    cdf = 0.0;

  else

    c = zeta ( a );
    cdf = 0.0;

    for y = 1 : x
      pdf = ( 1.0 / y^a ) / c;
      cdf = cdf + pdf;
    end

  end

  return
end
