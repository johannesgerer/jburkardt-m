function cdf = birthday_cdf ( n )

%*****************************************************************************80
%
%% BIRTHDAY_CDF returns the Birthday Concurrence CDF.
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
%    Input, integer N, the number of people whose birthdays have been
%    disclosed.
%
%    Output, real CDF, the probability that at least
%    two of the N people have matching birthays.
%
  if ( n < 1 )
    cdf = 0.0;
    return
  elseif ( 365 < n )
    cdf = 1.0;
    return
  end
%
%  Compute the probability that N people have distinct birthdays.
%
  cdf = 1.0;
  for i = 1 : n
    cdf = cdf * ( 365 + 1 - i ) / 365.0;
  end
%
%  Compute the probability that it is NOT the case that N people
%  have distinct birthdays.  This is the cumulative probability
%  that person 2 matches person 1, or person 3 matches 1 or 2, 
%  etc.
%
  cdf = 1.0 - cdf;

  return
end
