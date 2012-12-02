function value = i4_pochhammer ( i, j )

%*****************************************************************************80
%
%% I4_POCHHAMMER returns the value of ( I * (I+1) * ... * (J-1) * J ).
%
%  Discussion:
%
%    Pochhammer's symbol (A)_N is the value
%
%      (A)_N = Gamma ( A + N ) / Gamma ( A )
%
%    or, for integer arguments,
%
%      (I)_N = I * ( I + 1 ) * ... * ( I + N - 1 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, J, values that define the product.
%
%    Output, integer VALUE, the value of the product.
%
  value = prod ( i : j );

  return
end
