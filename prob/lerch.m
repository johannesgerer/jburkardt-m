function value = lerch ( a, b, c )

%*****************************************************************************80
%
%% LERCH estimates the Lerch transcendent function.
%
%  Discussion:
%
%    The Lerch transcendent function is defined as:
%
%      LERCH ( A, B, C ) = Sum ( 0 <= K < Infinity ) A**K / ( C + K )**B
%
%    excluding any term with ( C + K ) = 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2004
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
%    Input, real A, B, C, the parameters of the function.
%
%    Output, real VALUE, an approximation to the Lerch
%    transcendent function.
%
  sum2 = 0.0;
  k = 0;
  a_k = 1.0;

  while ( 1 )

    sum2_old = sum2;

    if ( c + k == 0.0 )
      k = k + 1;
      a_k = a_k * a;
      continue
    end

    sum2 = sum2 + a_k / ( c + k )^b;

    if ( sum2 <= sum2_old )
      break
    end

    k = k + 1;
    a_k = a_k * a;

  end

  value = sum2;

  return
end
