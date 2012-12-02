function b = r8poly_power ( na, a, p )

%*****************************************************************************80
%
%% R8POLY_POWER computes a positive integer power of a polynomial.
%
%  Discussion:
%
%    The power sum form is:
%
%      p(x) = a(0) + a(1)*x + ... + a(n-1)*x**(n-1) + a(n)*x**(n)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NA, the dimension of A.
%
%    Input, real A(1:NA+1), the polynomial to be raised to the power.
%
%    Input, integer P, the nonnegative power to which A is raised.
%
%    Output, real B(P*NA+1), the power of the polynomial.
%

%
%  Zero out B.
%
  b(1:p*na+1) = 0.0;
%
%  Search for the first nonzero element in A.
%
  nonzer = 0;

  for i = 0 : na
    if ( a(i+1) ~= 0.0 )
      nonzer = i;
      break
    end
  end

  if ( nonzer == 0 )
    return;
  end

  b(0+1) = a(nonzer+1)^p;

  for i = 1 : p*(na-nonzer)

    if ( i + nonzer <= na )
      b(i+1) = i * p * b(1) * a(i+nonzer+1);
    else
      b(i+1) = 0.0;
    end

    for j = 1 : i-1

      if ( j+nonzer <= na )
        b(i+1) = b(i+1) - ( i - j ) * a(j+nonzer+1) * b(i-j+1);
      end

      if ( i-j+nonzer <= na )
        b(i+1) = b(i+1) + ( i - j ) * p * b(j+1) * a(i-j+nonzer+1);
      end

    end

    b(i+1) = b(i+1) / ( i * a(nonzer+1) );

  end
%
%  Shift B up.
%
  for i = p*nonzer : p*na
    b(i+1) = b(i-p*nonzer+1);
  end

  for i = 0 : p * nonzer-1
    b(i+1) = 0.0;
  end

  return
end
