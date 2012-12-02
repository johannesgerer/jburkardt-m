function y = daub8_scale ( n, x )

%*****************************************************************************80
%
%% DAUB8_SCALE recursively evaluates the DAUB8 scaling function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the recursion level.
%
%    Input, real X, the point at which the function is to be evaluated.
%
%    Output, real Y, the estimated value of the function.
%
  c = [ ...
    0.2303778133088964; ... 
    0.7148465705529154; ...
    0.6308807679298587; ...
   -0.0279837694168599; ...
   -0.1870348117190931; ...
    0.0308413818355607; ...
    0.0328830116668852; ...
   -0.0105974017850690 ];

  c = c * sqrt ( 2.0 );

  if ( 0 < n )
    y = c(1) * daub8_scale ( n - 1, 2 * x     ) ...
      + c(2) * daub8_scale ( n - 1, 2 * x - 1 ) ...
      + c(3) * daub8_scale ( n - 1, 2 * x - 2 ) ...
      + c(4) * daub8_scale ( n - 1, 2 * x - 3 ) ...
      + c(5) * daub8_scale ( n - 1, 2 * x - 4 ) ...
      + c(6) * daub8_scale ( n - 1, 2 * x - 5 ) ...
      + c(7) * daub8_scale ( n - 1, 2 * x - 6 ) ...
      + c(8) * daub8_scale ( n - 1, 2 * x - 7 );
  else
    y = ( 0 <= x & x < 1 );
  end

  return
end
