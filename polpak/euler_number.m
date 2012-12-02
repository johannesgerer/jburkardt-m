function e = euler_number ( n )

%*****************************************************************************80
%
%% EULER_NUMBER computes the Euler numbers.
%
%  Discussion:
%
%    The Euler numbers can be evaluated in Mathematica by the call
%
%      EulerE[n]
%
%    These numbers rapidly get too big to store in an ordinary integer!
%
%    The terms of odd index are 0.
%
%    E(N) = -C(N,N-2) * E(N-2) - C(N,N-4) * E(N-4) - ... - C(N,0) * E(0).
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
%    02 June 2007
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
%    Input, integer N, the index of the last Euler number to compute.
%
%    Output, integer E(1:N+1), the Euler numbers.
%
  if ( n < 0 )
    e = [];
    return
  end

  e(1) = 1;

  if ( n == 0 )
    return
  end

  e(2) = 0;

  if ( n == 1 )
    return
  end

  e(3) = -1;

  for i = 3 : n

    e(i+1) = 0;

    if ( mod ( i, 2 ) == 0 )

      for j = 2 : 2 : i
        e(i+1) = e(i+1) - i4_choose ( i, j ) * e(i-j+1);
      end

    end

  end

  return
end
