function x = p15_start ( n )

%*****************************************************************************80
%
%% P15_START returns a starting point for optimization for problem 15.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2000
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables X.
%
%    Output, real X(N), a starting point for the optimization.
%
  x = zeros ( n, 1 );

  for i = 1 : n

    if ( mod ( i, 4 ) == 1 )
      x(i) = 3.0;
    elseif ( mod ( i, 4 ) == 2 )
      x(i) = - 1.0;
    elseif ( mod ( i, 4 ) == 3 )
      x(i) = 0.0;
    else
      x(i) = 1.0;
    end

  end

  return
end
