function [ x, ierror ] = congruence ( a, b, c )

%*****************************************************************************80
%
%% CONGRUENCE solves a congruence of the form A * X = C ( mod B ).
%
%  Discussion:
%
%    A, B and C are given integers.  The equation is solvable if and only
%    if the greatest common divisor of A and B also divides C.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 May 2008
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
%    Input, integer A, B, C, the coefficients of the Diophantine equation.
%
%    Output, integer X, the solution of the Diophantine equation.
%    X will be between 0 and B-1.
%
%    Output, integer IERROR, error flag.
%    0, no error, X was computed.
%    1, A = B = 0, C is nonzero.
%    2, A = 0, B and C nonzero, but C is not a multiple of B.
%    3, A nonzero, B zero, C nonzero, but C is not a multiple of A.
%    4, A, B, C nonzero, but GCD of A and B does not divide C.
%    5, algorithm ran out of internal space.
%
  nmax = 100;
%
%  Defaults for output parameters.
%
  ierror = 0;
  x = 0;
  y = 0;
%
%  Special cases.
%
  if ( a == 0 & b == 0 & c == 0 )
    x = 0;
    return
  elseif ( a == 0 & b == 0 & c ~= 0 )
    ierror = 1;
    x = 0;
    return
  elseif ( a == 0 & b ~= 0 & c == 0 )
    x = 0;
    return
  elseif ( a == 0 & b ~= 0 & c ~= 0 )
    x = 0;
    if ( mod ( c, b ) ~= 0 )
      ierror = 2;
    end
    return
  elseif ( a ~= 0 & b == 0 & c == 0 )
    x = 0;
    return
  elseif ( a ~= 0 & b == 0 & c ~= 0 )
    x = c / a;
    if ( mod ( c, a ) ~= 0 )
      ierror = 3;
    end
    return
  elseif ( a ~= 0 & b ~= 0 & c == 0 )
%   g = i4_gcd ( a, b );
%   x = b / g;
    x = 0;
    return
  end
%
%  Now handle the "general" case: A, B and C are nonzero.
%
%  Step 1: Compute the GCD of A and B, which must also divide C.
%
  g = i4_gcd ( a, b );

  if ( mod ( c, g ) ~= 0 )
    ierror = 4;
    return
  end

  a_copy = a / g;
  b_copy = b / g;
  c_copy = c / g;
%
%  Step 2: Split A and B into sign and magnitude.
%
  a_mag = abs ( a_copy );
  a_sign = i_sign ( a_copy );
  b_mag = abs ( b_copy );
  b_sign = i_sign ( b_copy );
%
%  Another special case, A_MAG = 1 or B_MAG = 1.
%
  if ( a_mag == 1 )
    x = a_sign * c_copy;
    return
  elseif ( b_mag == 1 )
    x = 0;
    return
  end
%
%  Step 3: Produce the Euclidean remainder sequence.
%
  if ( b_mag <= a_mag )

    swap = 0;
    q(1) = a_mag;
    q(2) = b_mag;

  else

    swap = 1;
    q(1) = b_mag;
    q(2) = a_mag;

  end

  n = 3;

  while ( 1 )

    q(n) = mod ( q(n-2), q(n-1) );

    if ( q(n) == 1 )
      break;
    end

    n = n + 1;

    if ( nmax < n )
      ierror = 5;
      fprintf ( 1, '\n' );
      fprintf ( 1, 'CONGRUENCE - Fatal error!\n' );
      fprintf ( 1, '  Exceeded number of iterations.\n' );
      error ( 'CONGRUENCE - Fatal error!' );
    end

  end
%
%  Step 4: Now go backwards to solve X * A_MAG + Y * B_MAG = 1.
%
  y = 0;
  for k = n : -1 : 2
    x = y;
    y = ( 1 - x * q(k-1) ) / q(k);
  end
%
%  Step 5: Undo the swapping.
%
  if ( swap )
    z = x;
    x = y;
    y = z;
  end
%
%  Step 6: Now apply signs to X and Y so that X * A + Y * B = 1.
%
  x = x * a_sign;
%
%  Step 7: Multiply by C, so that X * A + Y * B = C.
%
  x = x * c_copy;
%
%  Step 8: Now force 0 <= X < B.
%
  x = mod ( x, b );
%
%  Step 9: Force positivity.
%
  if ( x < 0 )
    x = x + b;
  end

  return
end
