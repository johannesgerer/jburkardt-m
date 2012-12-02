function value = factorial ( n )

%*****************************************************************************80
%
%% FACTORIAL demonstrates the use of recursion in MATLAB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the argument.
%
%    Output, integer VALUE, the factorial of N.
%

%
%  Some condition must be checked that allows you to halt the
%  recursion.
%
  if ( n <= 1 )
    value = 1;
%
%  If the condition is not met, you call again, in a way that
%  makes the stopping condition more likely.
%
  else
    value = n * factorial ( n - 1 );
  end

  return
end
