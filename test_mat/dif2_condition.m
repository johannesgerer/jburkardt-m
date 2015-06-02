function value = dif2_condition ( n )

%*****************************************************************************80
%
%% DIF2_CONDITION returns the L1 condition of the DIF2 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real VALUE, the L1 condition.
%
  if ( n == 1 )
    a_norm = 2.0;
  elseif ( n == 2 )
    a_norm = 3.0;
  else
    a_norm = 4.0;
  end

  b_norm = 0.0;
  for j = 1 : n
    t = 0.0;
    for i = 1 : n
      if ( i <= j )
        t = t + ( i * ( n - j + 1 ) ) / ( n + 1 );
      else
        t = t + ( j * ( n - i + 1 ) ) / ( n + 1 );
      end
    end
    b_norm = max ( b_norm, t );
  end

  value = a_norm * b_norm;

  return
end
