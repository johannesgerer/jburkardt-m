function pdf = birthday_pdf ( n )

%*****************************************************************************80
%
%% BIRTHDAY_PDF returns the Birthday Concurrence PDF.
%
%  Discussion:
%
%    The probability is the probability that the N-th person is the
%    first one to match a birthday with someone earlier.
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
%    Output, real PDF, the probability that the N-th person
%    is the first to match a birthday with someone earlier.
%
  if ( n < 1 || 365 < n )
    pdf = 0.0;
    return
  end

  pdf = 1.0;
%
%  Compute the probability that N-1 people have distinct birthdays.
%
  for i = 1 : n-1
    pdf = pdf * ( 365 + 1 - i ) / 365.0;
  end
%
%  Compute the probability that person N has one of those N-1 birthdays.
%
  pdf = pdf * ( n - 1 ) / 365.0;

  return
end
