function coefs = zernike_poly_coef ( m, n )

%*****************************************************************************80
%
%% ZERNIKE_POLY_COEF: coefficients of a Zernike polynomial.
%
%  Discussion:
%
%    With our coefficients stored in COEFS(1:N+1), the
%    radial function R^M_N(RHO) is given by
%
%      R^M_N(RHO) = COEFS(1) 
%                 + COEFS(2) * RHO
%                 + COEFS(3) * RHO^2
%                 + ...
%                 + COEFS(N+1) * RHO^N
%
%    and the odd and even Zernike polynomials are
%
%      Z^M_N(RHO,PHI,odd)  = R^M_N(RHO) * sin(PHI)
%      Z^M_N(RHO,PHI,even) = R^M_N(RHO) * cos(PHI)
%
%    The first few "interesting" values of R are:
%
%    R^0_0 = 1
%
%    R^1_1 = RHO
%
%    R^0_2 = 2 * RHO^2 - 1
%    R^2_2 =     RHO^2
%
%    R^1_3 = 3 * RHO^3 - 2 * RHO
%    R^3_3 =     RHO^3
%
%    R^0_4 = 6 * RHO^4 - 6 * RHO^2 + 1
%    R^2_4 = 4 * RHO^4 - 3 * RHO^2
%    R^4_4 =     RHO^4
%
%    R^1_5 = 10 * RHO^5 - 12 * RHO^3 + 3 * RHO
%    R^3_5 =  5 * RHO^5 -  4 * RHO^3
%    R^5_5 =      RHO^5
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Eric Weisstein,
%    Zernike Polynomials,
%    CRC Concise Encyclopedia of Mathematics,
%    CRC Press, 1998,
%    QA5.W45
%
%  Parameters:
%
%    Input, integer M, N, the parameters of the polynomial.
%    Normally, 0 <= M <= N and 0 <= N.
%  
%    Output, real COEFS(1:N+1), the coefficients of the polynomial.
%
  coefs(1:n+1) = 0;

  if ( n < 0 )
    return
  end

  if ( m < 0 )
    return
  end
      
  if ( n < m )
    return
  end

  if ( mod ( m - n, 2 ) == 1 )
    return
  end

  nm_plus = ( m + n ) / 2;
  nm_minus = ( n - m ) / 2;

  coefs(n+1) = r8_choose ( n, nm_plus );

  for l = 0 : nm_minus - 1

    coefs(n+1-2*l-2) = - ( nm_plus - l ) * ( nm_minus - l ) * coefs(n+1-2*l)...
      / ( ( n - l ) * ( l + 1 ) );
  end 

  return
end
