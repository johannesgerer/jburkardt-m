function value = euler_number2 ( n )

%*****************************************************************************80
%
%% EULER_NUMBER2 computes the Euler numbers.
%
%  Discussion:
%
%    The Euler numbers can be evaluated in Mathematica with the call
%
%      EulerE[n]
%
%  First terms:
%
%    E0  = 1
%    E1  = 0
%    E2  = -1
%    E3  = 0
%    E4  = 5
%    E5  = 0
%    E6  = -61
%    E7  = 0
%    E8  = 1385
%    E9  = 0
%    E10 = -50521
%    E11 = 0
%    E12 = 2702765
%    E13 = 0
%    E14 = -199360981
%    E15 = 0
%    E16 = 19391512145
%    E17 = 0
%    E18 = -2404879675441
%    E19 = 0
%    E20 = 370371188237525
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Stephen Wolfram,
%    The Mathematica Book,
%    Fourth Edition,
%    Wolfram Media / Cambridge University Press, 1999.
%
%  Parameters:
%
%    Input, integer N, the index of the Euler number to compute.
%
%    Output, real VALUE, the value of E(N).
%
  e = [ 1.0, -1.0, 5.0, -61.0, 1385.0, -50521.0, 2702765.0 ];
  itmax = 1000;

  if ( n < 0 )
    value = [];
    return
  end

  if ( n == 0 )
    value = e(1);
    return
  end

  if ( mod ( n, 2 ) == 1 )
    value = 0.0;
    return
  end

  if ( n <= 12 )
    value = e(1+n/2);
    return
  end

  sum1 = 0.0;
  for i = 1 : itmax

    term = 1.0 / ( ( 2 * i - 1 )^( n + 1 ) );

    if ( mod ( i, 2 ) == 1 )
      sum1 = sum1 + term;
    else
      sum1 = sum1 - term;
    end

    if ( abs ( term ) < 1.0E-10 )
      break
    elseif ( abs ( term ) < 1.0E-08 * abs ( sum1 ) )
      break
    end

  end

  value = 2.0^( n + 2 ) * sum1 * r8_factorial ( n ) / pi^( n + 1 );

  if ( mod ( n, 4 ) ~= 0 )
    value = -value;
  end

  return
end
