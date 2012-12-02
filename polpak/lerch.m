function value = lerch ( z, s, a )

%*****************************************************************************80
%
%% LERCH estimates the Lerch transcendent function.
%
%  Discussion:
%
%    The Lerch transcendent function is defined as:
%
%      LERCH ( Z, S, A ) = Sum ( 0 <= K < Infinity ) Z**K / ( A + K )**S
%
%    excluding any term with ( A + K ) = 0.
%
%    In Mathematica, the function can be evaluated by:
%
%      LerchPhi[z,s,a]
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Eric Weisstein, editor,
%    CRC Concise Encylopedia of Mathematics,
%    CRC Press, 1998.
%
%  Thanks:
%
%    Oscar van Vlijmen
%
%  Parameters:
%
%    Input, real Z, integer S, real A,
%    the parameters of the function.
%
%    Output, real VALUE, an approximation to the Lerch
%    transcendent function.
%
  value = 0.0;

  if ( z <= 0.0 )
    return
  end

  eps = 1.0E-10;
  value = 0.0;
  k = 0;
  z_k = 1.0;

  while ( 1 )

    if ( a + k ~= 0.0 )

      term = z_k / ( a + k )^s;
      value = value + term;

      if ( abs ( term ) <= eps * ( 1.0 + abs ( value ) ) )
        break
      end

    end

    k = k + 1;
    z_k = z_k * z;

  end

  return
end
