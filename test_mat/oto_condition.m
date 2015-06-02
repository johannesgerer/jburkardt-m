function value = oto_condition ( n )

%*****************************************************************************80
%
%% OTO_CONDITION returns the L1 condition of the OTO matrix.
%
%  Discussion:
%
%    I knew it had to be possible to work out this condition number!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real VALUE, the L1 condition number.
%
  if ( n == 1 )
    a_norm = 2.0;
  elseif ( n == 2 )
    a_norm = 3.0;
  else
    a_norm = 4.0;
  end

  n1 = floor ( ( n + 1 ) / 2 );
  n2 = floor ( ( n + 2 ) / 2 );

  s = 0;
  i1 = n1;
  i2 = 0;

  while ( i2 < n2 )
    i2 = i2 + 1;
    s = s + i1 * i2;
  end

  while ( 1 < i1 )
    i1 = i1 - 1;
    s = s + i1 * i2;
  end

  b_norm = s / ( n + 1 );

  value = a_norm * b_norm;

  return
end
