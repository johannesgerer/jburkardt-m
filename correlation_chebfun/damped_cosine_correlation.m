function K = damped_cosine_correlation ( s, t )

%*****************************************************************************80
%
%% DAMPED_COSINE_CORRELATION evaluates the damped_cosine correlation function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Petter Abrahamsen,
%    A Review of Gaussian Random Fields and Correlation Functions,
%    Norwegian Computing Center, 1997.
%
  K = exp ( - abs ( s - t ) ) .* cos ( abs ( s - t ) );

  return
end


  
