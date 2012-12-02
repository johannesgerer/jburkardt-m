function k = i8_xor ( i, j )

%*****************************************************************************80
%
%% I8_XOR calculates the exclusive OR of two integers.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 February 2005
%
%  Author:
%
%   John Burkardt
%
%  Parameters:
%
%    Input, integer I, J, two values whose exclusive OR is needed.
%
%    Output, integer K, the exclusive OR of I and J.
%
  k = 0;
  l = 1;

  i = floor ( i );
  j = floor ( j );

  while ( i ~= 0 | j ~= 0 )
%
%  Check the current right-hand bits of I and J.
%  If they differ, set the appropriate bit of K.
%
    i2 = floor ( i / 2 );
    j2 = floor ( j / 2 );

    if ( ...
      ( ( i == 2 * i2 ) & ( j ~= 2 * j2 ) ) | ...
      ( ( i ~= 2 * i2 ) & ( j == 2 * j2 ) ) )
      k = k + l;
    end

    i = i2;
    j = j2;
    l = 2 * l;

  end

  return
end
