function value = r8_factorial ( n )

%*****************************************************************************80
%
%% R8_FACTORIAL returns N!.
%
%  Discussion:
%
%    N! = Product ( 1 <= I <= N ) I
%
%  Modified:
%
%    02 February 1999
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the argument of the function.
%    0 <= N.
%
%    Output, real VALUE, the factorial of N.
%
  if ( n < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_FACTORIAL - Fatal error!\n' );
    fprintf ( 1, '  N < 0.\n' );
    error ( 'R8_FACTORIAL - Fatal error!' );
  end

  value = 1.0;

  for i = 2 : n
    value = value * i;
  end

  return
end
