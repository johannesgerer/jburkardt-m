function z = zernike_poly ( m, n, rho )

%*****************************************************************************80
%
%% ZERNIKE_POLY evaluates a Zernike polynomial at RHO.
%
%  Discussion:
%
%    This routine uses the facts that:
%
%    *) R^M_N = 0 if M < 0, or N < 0, or N < M.
%    *) R^M_M = RHO^M
%    *) R^M_N = 0 if mod ( N - M ) = 1.
%
%    and the recursion:
%
%    R^M_(N+2) = A * [ ( B * RHO**2 - C ) * R^M_N - D * R^M_(N-2) ]
%
%    where
%
%    A = ( N + 2 ) / ( ( N + 2 )**2 - M**2 )
%    B = 4 * ( N + 1 )
%    C = ( N + M )**2 / N + ( N - M + 2 )**2 / ( N + 2 )
%    D = ( N**2 - M**2 ) / N
%
%    I wish I could clean up the recursion in the code, but for
%    now, I have to treat the case M = 0 specially.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Eric Weisstein,
%    "Zernike Polynomials",
%    CRC Concise Encyclopedia of Mathematics,
%    CRC Press, 1999,
%    QA5.W45
%
%  Parameters:
%
%    Input, integer M, the upper index.
%
%    Input, integer N, the lower index.
%
%    Input, real RHO, the radial coordinate.
%
%    Output, real Z, the value of the Zernike
%    polynomial R^M_N at the point RHO.
%

%
%  Do checks.
%
  if ( m < 0 )
    z = 0.0;
    return
  end

  if ( n < 0 )
    z = 0.0;
    return
  end

  if ( n < m )
    z = 0.0;
    return
  end

  if ( mod ( n - m, 2 ) == 1 )
    z = 0.0;
    return
  end

  zm2 = 0.0;
  z = rho^m;

  if ( m == 0 )

    if ( n == 0 )
      return
    end

    zm2 = z;
    z = 2.0 * rho * rho - 1.0;

    for nn = m+2 : 2 : n-2

      a = ( nn + 2 ) / ( ( nn + 2 ) * ( nn + 2 ) - m * m );

      b = 4 * ( nn + 1 );

      c = ( ( nn + m ) * ( nn + m ) ) / ( nn ) ...
        + ( ( nn - m + 2 ) * ( nn - m + 2 ) ) / ( nn + 2 );

      d = ( nn * nn - m * m ) / nn;

      zp2 = a * ( ( b * rho * rho - c ) * z - d * zm2 );
      zm2 = z;
      z = zp2;

    end

  else

    for nn = m : 2 : n-2

      a = ( nn + 2 ) / ( ( nn + 2 ) * ( nn + 2 ) - m * m );

      b = 4 * ( nn + 1 );

      c = ( ( nn + m ) * ( nn + m ) ) / ( nn ) ...
        + ( ( nn - m + 2 ) * ( nn - m + 2 ) ) / ( nn + 2 );

      d = ( nn * nn - m * m ) / nn;

      zp2 = a * ( ( b * rho * rho - c ) * z - d * zm2 );
      zm2 = z;
      z = zp2;

    end

  end

  return
end
