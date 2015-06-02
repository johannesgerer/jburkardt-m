function y = i4_mod_inv ( b, n )

%*****************************************************************************80
%
%% I4_MOD_INV calculates the inverse of B mod N.
%
%  Discussion:
%
%    This function uses the extended Euclidean algorithm.
%
%    Unless the algorithm fails, the output value Y will satisfy
%
%      ( B * Y ) mod N = 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 August 2011
%
%  Author:
%
%    John Burkardt.
%
%  Reference:
%
%    Wade Trappe, Lawrence Washington,
%    Introduction to Cryptography with Coding Theory,
%    Prentice Hall, 2005,
%    ISBN13: 978-0131862395,
%    LC: QA268.T73.
%
%  Parameters:
%
%    Input, integer B, the value whose inverse is desired.
%    B must not be 0, or a multiple of N.  However, B can be negative.
%
%    Input, integer N, the value with respect to which the inverse is desired.
%    N must be 2 or greater.
%
%    Output, integer Y, the inverse of B mod N.  However, if the inverse
%    does not exist, Y is returned as the empty value [].
%
  n0 = n;
  b0 = abs ( b );
  t0 = 0;
  t = 1;

  q = floor ( n0 / b0 );
  r = n0 - q * b0;

  while ( 0 < r )

    temp = t0 - q * t;

    if ( 0 <= temp )
      temp =     mod (   temp, n );
    else
      temp = n - mod ( - temp, n );
    end

    n0 = b0;
    b0 = r;
    t0 = t;
    t = temp;

    q = floor ( n0 / b0 );
    r = n0 - q * b0;

  end

  if ( b0 ~= 1 )
    y = [];
  else
    y = mod ( t, n );
    if ( b < 0 )
      y = - y;
    end
  end

  return
end
