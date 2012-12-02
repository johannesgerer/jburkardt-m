function s = dec_to_s ( mantissa, exponent )

%*****************************************************************************80
%
%% DEC_TO_S returns a string representation of a decimal.
%
%  Discussion:
%
%    A decimal value is represented by MANTISSA * 10**EXPONENT.
%
%  Example:
%
%    MANTISSA EXPONENT   S
%    ----     ----       ------
%       0        0       0
%      21        3       21000
%      -3        0       -3
%     147       -2       14.7
%      16       -5       0.00016
%      34       30       Inf
%     123      -21       0.0000000000000000012
%      34      -30       0.0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer MANTISSA, EXPONENT, integers which represent the decimal.
%
%    Output, character S(*), the representation of the value.
%    The string is 'Inf' or '0.0' if the value was too large
%    or small to represent with a fixed point format.
%
  s = ' ';

  if ( mantissa == 0 )
    s = '0';
    return
  end
%
%  Store a representation of MANTISSA in CHRREP.
%
  chrrep = sprintf ( '%d', mantissa );
  ndigit = s_len_trim ( chrrep );
%
%  If EXPONENT is nonnegative, insert trailing zeros.
%
  if ( 0 <= exponent )

    s(1:ndigit) = chrrep(1:ndigit);

    for i = ndigit + 1 : ndigit + exponent
      s(i) = '0';
    end

  elseif ( exponent < 0 )

    iput2 = 0;
    iget2 = 0;
%
%  Sign.
%
    if ( mantissa < 0 )
      iput1 = 1;
      iput2 = 1;
      iget2 = 1;
      s(iput1) = '-';
      ndigit = ndigit - 1;
    end
%
%  Digits of the integral part.
%
    if ( 0 < ndigit + exponent )
      iput1 = iput2 + 1;
      iput2 = iput1 + ndigit + exponent -1;
      iget1 = iget2 + 1;
      iget2 = iget1 + ndigit + exponent - 1;
      s(iput1:iput2) = chrrep(iget1:iget2);
    else
      iput1 = iput2 + 1;
      iput2 = iput1;
      s(iput1:iput2) = '0';
    end
%
%  Decimal point.
%
    iput1 = iput2 + 1;
    iput2 = iput1;
    s(iput1:iput2) = '.';
%
%  Leading zeroes.
%
    for i = 1 : - exponent - ndigit
      iput1 = iput2 + 1;
      iput2 = iput1;
      s(iput1:iput2) = '0';
    end

    nleft = min ( -exponent, ndigit );
    iput1 = iput2 + 1;
    iput2 = iput1 + nleft - 1;
    iget1 = iget2 + 1;
    iget2 = iget1 + nleft - 1;
    s(iput1:iput2) = chrrep(iget1:iget2);

  end

  return
end
