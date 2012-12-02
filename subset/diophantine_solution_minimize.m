function [ x, y ] = diophantine_solution_minimize ( a, b, x, y )

%*****************************************************************************80
%
%% DIOPHANTINE_SOLUTION_MINIMIZE seeks a minimal solution of a Diophantine equation.
%
%  Discussion:
%
%    Given a solution (X,Y) of a Diophantine equation:
%
%      A * X + B * Y = C.
%
%    then there are an infinite family of solutions of the form
%
%      ( X(i), Y(i) ) = ( X + i * B, Y - i * A )
%
%    An integral solution of minimal Euclidean norm can be found by
%    tentatively moving along the vectors (B,-A) and (-B,A) one step
%    at a time.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Eric Weisstein, editor,
%    CRC Concise Encylopedia of Mathematics,
%    CRC Press, 1998, page 446.
%
%  Parameters:
%
%    Input, integer A, B, the coefficients of the Diophantine equation.
%    A and B are assumed to be relatively prime.
%
%    Input, integer X, Y, on input, a solution of the Diophantine equation.
%
%    Output, integer X, Y, a solution of minimal Euclidean norm.
%

%
%  Compute the minimum for T real, and then look nearby.
%
  t = ( - b * x + a * y ) / ( a * a + b * b );

  x = x + round ( t ) * b;
  y = y - round ( t ) * a;
%
%  Look nearby.
%
  norm = x * x + y * y;

  while ( 1 )

    x2 = x + b;
    y2 = y - a;

    norm2 = x2 * x2 + y2 * y2;

    if ( norm <= norm2 )
      break
    end

    x = x2;
    y = y2;
    norm = norm2;

  end

  while ( 1 )

    x2 = x - b;
    y2 = y + a;

    norm2 = x2 * x2 + y2 * y2;

    if ( norm <= norm2 )
      break
    end

    x = x2;
    y = y2;
    norm = norm2;

  end

  return
end
