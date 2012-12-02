function fx = p07_fun ( n, x )

%*****************************************************************************80
%
%% P07_FUN evaluates the integrand for problem 7.
%
%  Discussion:
%
%    D&R gives "exact" value as 0.16266891...
%    Mathematica does not return a value.
%    D&R gives Laguerre(16) as  0.097083064...
%
%  Integral:
%
%    exp ( -2 ) Integral ( 2 <= x < +oo ) sin ( x - 1 ) dx
%      / sqt ( x * ( x - 2 ) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 July 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Philip Davis, Philip Rabinowitz,
%    Methods of Numerical Integration,
%    Second Edition,
%    Dover, 2007,
%    ISBN: 0486453391,
%    LC: QA299.3.D28.
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the function values.
%
  for i = 1 : n

    if ( x(i) == 2.0 )
      fx(i) = 0.0;
    else
      fx(i) = exp ( -2.0 ) ...
        * sin ( x(i) - 1.0 ) / sqrt ( x(i) * ( x(i) - 2.0 ) );
    end

  end

  return
end
