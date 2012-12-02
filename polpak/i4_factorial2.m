function value = i4_factorial2 ( n )

%*****************************************************************************80
%
%% I4_FACTORIAL2 computes the factorial N!!
%
%  Formula:
%
%    FACTORIAL2( N ) = Product ( N * (N-2) * (N-4) * ... * 2 )  (N even)
%                    = Product ( N * (N-2) * (N-4) * ... * 1 )  (N odd)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the argument of the double factorial function.
%    If N is less than 1, VALUE is returned as 1.
%
%    Output, integer VALUE, the value of N!!.
%
  value = 1;

  if ( n < 1 )
    return
  end

  while ( 1 < n )
    value = value * n;
    n = n - 2;
  end

  return
end
