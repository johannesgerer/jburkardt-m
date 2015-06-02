function value = r8_uniform_sample ( low, high )

%*****************************************************************************80
%
%% R8_UNIFORM_SAMPLE generates a uniform random deviate.
%
%  Discussion:
%
%    This procedure generates a real deviate uniformly distributed between
%    LOW and HIGH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2013
%
%  Author:
%
%    Original FORTRAN77 version by Barry Brown, James Lovato.
%    MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, real LOW, HIGH, the lower and upper bounds.
%
%    Output, real VALUE, a random deviate 
%    from the distribution.
%
  value = low + ( high - low ) * r8_uniform_01_sample ( );

  return
end
