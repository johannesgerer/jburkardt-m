function fx = p18_fx ( x )

%*****************************************************************************80
%
%% P18_FX evaluates the function for problem 18.
%
%  Discussion:
%
%    F(X) = 10^14 * (x-1)^7, but is written in term by term form.
%
%    This polynomial becomes difficult to evaluate accurately when 
%    written this way.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Cleve Moler,
%    Numerical Computing with MATLAB,
%    SIAM, 2004,
%    ISBN13: 978-0-898716-60-3,
%    LC: QA297.M625.
%
%  Parameters:
%
%    Input, real X(*), the point at which F is to be evaluated.
%
%    Output, real FX(*), the value of the function at X.
%
  fx = 10.0^14 * ( ...
            x.^7 ...
     -  7 * x.^6 ...
     + 21 * x.^5 ...
     - 35 * x.^4 ...
     + 35 * x.^3 ...
     - 21 * x.^2 ...
     +  7 * x ...
     -  1 );

  return
end
