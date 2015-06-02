function fx = p04_fun ( n, x )

%*****************************************************************************80
%
%% P04_FUN evaluates the integrand for problem 4.
%
%  Discussion:
%
%    D&R gives "exact" value as -0.0046984...
%    Mathematica returns        -0.0046848541335080643181...
%    D&R gives Laguerre(16) as  -0.039258696...
%
%  Integral:
%
%    exp ( -2 ) Integral ( 2 <= x < +oo ) sin ( x ) / x dx
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
    if ( x(i) == 0.0 )
      fx(i) = exp ( -2.0 );
    else
      fx(i) = exp ( -2.0 ) * sin ( x(i) ) / x(i);
    end
  end

  return
end
