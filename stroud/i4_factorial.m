function value = i4_factorial ( n )

%*****************************************************************************80
%
%% I4_FACTORIAL computes N! (for small values of N).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the argument.
%
%    Output, integer VALUE, the value of N!.
%
  value = prod ( 1 : n );

  return
end
