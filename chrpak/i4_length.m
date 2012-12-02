function value = i4_length ( i4 )

%*****************************************************************************80
%
%% I4_LENGTH computes the number of characters needed to print an I4.
%
%  Example:
%
%        I4    I4_LENGTH
%
%         0       1
%         1       1
%        -1       2
%      1952       4
%    123456       6
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 April 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the integer whose length is desired.
%
%    Output, integer VALUE, the number of characters required
%    to print the integer.
%
  i4 = floor ( i4 );

  if ( i4 < 0 )
    value = 1;
  elseif ( i4 == 0 )
    value = 1;
    return
  else
    value = 0;
  end

  i4 = abs ( i4 );

  while ( i4 ~= 0 )

    value = value + 1;

    i4 = floor ( i4 / 10 );

  end

  return
end
