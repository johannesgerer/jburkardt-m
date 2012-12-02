function [ a, p, q ] = r8_to_cfrac ( r, n )

%*****************************************************************************80
%
%% R8_TO_CFRAC converts an R8 to a continued fraction.
%
%  Discussion:
%
%    The routine is given a real number R.  It computes a sequence of
%    continued fraction approximations to R, returning the results as
%    simple fractions of the form P(I) / Q(I).
%
%  Example:
%
%    X = 2 * PI
%    N = 7
%
%    A = [ *, 6,  3,  1,  1,   7,   2,    146,      3 ]
%    P = [ 1, 6, 19, 25, 44, 333, 710, 103993, 312689 ]
%    Q = [ 0, 1,  3,  4,  7,  53, 113,  16551,  49766 ]
%
%    (This ignores roundoff error, which will cause later terms to differ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Norman Richert,
%    Strang's Strange Figures,
%    American Mathematical Monthly,
%    Volume 99, Number 2, February 1992, pages 101-107.
%
%  Parameters:
%
%    Input, double precision R, the real value.
%
%    Input, integer N, the number of convergents to compute.
%
%    Output, integer A(1:N+1), the partial quotients.
%
%    Output, integer P(1:N+2), Q(1:N+2), the numerators and denominators
%    of the continued fraction approximations.
%
  if ( r == 0.0 )
    a(1:n+1) = 0;
    p(1:n+2) = 0;
    q(1:n+2) = 1;
    return
  end

  p(1) = 1;
  q(1) = 0;

  p(2) = floor ( abs ( r ) );
  q(2) = 1;
  x(1) = abs ( r );
  a(1) = floor ( x(1) );

  for i = 1 : n

    if ( ( x(i) - a(i) ) == 0.0 )
      break;
    end

    x(i+1) = 1.0 / ( x(i) - a(i) );
    a(i+1) = floor ( x(i+1) );
    p(i+2) = a(i+1) * p(i+1) + p(i);
    q(i+2) = a(i+1) * q(i+1) + q(i);

  end

  if ( r < 0.0 )
    p(1:n+2) = -p(1:n+2)
  end

  return
end
