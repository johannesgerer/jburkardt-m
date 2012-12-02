function [ r, s ] = rfrac_to_jfrac ( m, p, q )

%*****************************************************************************80
%
%% RFRAC_TO_JFRAC converts a rational polynomial fraction to a J fraction.
%
%  Discussion:
%
%    The routine accepts
%
%    P(1) + P(2) * X + ... + P(M) * X**(M-1)
%    -------------------------------------------------------
%    Q(1) + Q(2) * X + ... + Q(M) * X**(M-1) + Q(M+1) * X**M
%
%    and returns the equivalent J-fraction:
%
%    R(1) / ( X + S(1) + 
%    R(2) / ( X + S(2) + 
%    R(3) / ...        +
%    R(M) / ( X + S(M) )... ))
%
%    Thanks to Henry Amuasi for noticing and correcting an error in a
%    previous formulation of this routine, 02 October 2010.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 October 2010
%
%  Author:
%
%    Original FORTRAN77 version by John Hart, Ward Cheney, Charles Lawson, 
%    Hans Maehly, Charles Mesztenyi, John Rice, Henry Thatcher, 
%    Christoph Witzgall.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    John Hart, Ward Cheney, Charles Lawson, Hans Maehly, Charles Mesztenyi, 
%    John Rice, Henry Thatcher, Christoph Witzgall,
%    Computer Approximations,
%    Wiley, 1968.
%
%  Parameters:
%
%    Input, integer M, defines the number of P, R, and S coefficients,
%    and is one less than the number of Q coefficients.
%    1 <= M.
%
%    Input, real P(M), Q(M+1), the coefficients defining the rational
%    polynomial fraction.
%
%    Output, real R(M), S(M), the coefficients defining the
%    J-fraction.
%
  if ( m < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RFRAC_TO_JFRAC - Fatal error!\n' );
    fprintf ( 1, '  M < 1\n' );
    error ( 'RFRAC_TO_JFRAC - Fatal error!' );
  end

  a(1:m+1,1) = q(1:m+1)';
  a(1:m,  2) = p(1:m)';

  if ( 1 < m )

    r(1) = a(m,2) / a(m+1,1);
    s(1) = ( r(1) * a(m,1) - a(m-1,2) ) / a(m,2);

    for k = 1 : m - 2

      a(1,k+2) = r(k) * a(1,k) - s(k) * a(1,k+1);
      a(2:m-k,k+2) = r(k) * a(2:m-k,k) - a(1:m-k-1,k+1) - s(k) * a(2:m-k,k+1);

      if ( a(m-k,k+2) == 0.0 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'RFRAC_TO_JFRAC - Fatal error!\n' );
        fprintf ( 1, '  A(M-K,K+2) = 0 for K = %d\n', k );
        error ( 'RFRAC_TO_JFRAC - Fatal error!' );
      end

      r(k+1) = a(m-k,k+2) / a(m-k+1,k+1);
      s(k+1) = ( r(k+1) * a(m-k,k+1) - a(m-k-1,k+2) ) / a(m-k,k+2);

    end

    a(1,m+1) = r(m-1) * a(1,m-1) - s(m-1) * a(1,m);

  end

  r(m) = a(1,m+1) / a(2,m);
  s(m) = a(1,m) / a(2,m);

  return
end
