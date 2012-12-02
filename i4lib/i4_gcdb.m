function value = i4_gcdb ( i, j, k )

%*****************************************************************************80
%
%% I4_GCDB finds the greatest common divisor of the form K**N of two numbers.
%
%  Discussion:
%
%    Note that if J is negative, I4_GCDB will also be negative.
%    This is because it is likely that the caller is forming
%    the fraction I/J, and so any minus sign should be
%    factored out of J.
%
%    If I and J are both zero, I4_GCDB is returned as 1.
%
%    If I is zero and J is not, I4_GCDB is returned as J,
%    and vice versa.
%
%    If I and J are nonzero, and have no common divisor of the
%    form K**N, I4_GCDB is returned as 1.
%
%    Otherwise, I4_GCDB is returned as the largest common divisor
%    of the form K**N shared by I and J.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, J, two numbers whose greatest common divisor K**N
%    is desired.
%
%    Input, integer K, the possible divisor of I and J.
%
%    Output, integer VALUE, the greatest common divisor of
%    the form K**N shared by I and J.
%
  value = 1;
%
%  If both I and J are zero, I4_GCDB is 1.
%
  if ( i == 0 & j == 0 )
    value = 1;
    return
  end
%
%  If just one of I and J is zero, I4_GCDB is the other one.
%
  if ( i == 0 )
    value = j;
    return
  elseif ( j == 0 )
    value = i;
    return
  end
%
%  Divide out K as long as you can.
%
  if ( 0 < j )
    value = 1;
  else
    value = -1;
  end

  while

    if ( mod ( i, k ) ~= 0 | mod ( j, k ) ~= 0 )
      break
    end

    value = value * k;
    i = i / k;
    j = j / k;

  end

  return
end
