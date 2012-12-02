function n = birthday_cdf_inv ( cdf )

%*****************************************************************************80
%
%% BIRTHDAY_CDF_INV inverts the Birthday Concurrence CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 August 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real CDF, the probability that at least
%    two of the N people have matching birthays..
%
%    Output, integer N, the corresponding number of people whose
%    birthdays need to be disclosed.
%
  if ( cdf <= 0.0 )
    n = 0;
    return
  elseif ( 1.0 <= cdf )
    n = 365;
    return
  end
%
%  Compute the probability that N people have distinct birthdays.
%
  cdf_not = 1.0;

  for i = 1 : 365
    cdf_not = cdf_not * ( 365 + 1 - i ) / 365.0;
    if ( cdf <= 1.0 - cdf_not )
      n = i;
      return
    end
  end

  n = 365;

  return
end
