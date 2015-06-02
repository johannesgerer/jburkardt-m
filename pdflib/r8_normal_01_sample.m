function value = r8_normal_01_sample ( )

%*****************************************************************************80
%
%% R8_NORMAL_01_SAMPLE returns a unit pseudonormal R8.
%
%  Discussion:
%
%    The standard normal probability distribution function (PDF) has
%    mean 0 and standard deviation 1.
%
%    The Box-Muller method is used, which is efficient, but
%    generates two values at a time.  
%
%    Typically, we would use one value and save the other for the next call.
%    However, the fact that this function has saved memory makes it difficult
%    to correctly handle cases where we want to re-initialize the code,
%    or to run in parallel.  Therefore, we will instead use the first value
%    and DISCARD the second.
%
%    EFFICIENCY must defer to SIMPLICITY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 August 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, a sample of the standard normal PDF.
%
  r1 = r8_uniform_01_sample ( );
  r2 = r8_uniform_01_sample ( );

  x = sqrt ( - 2.0 * log ( r1 ) ) * cos ( 2.0 * pi * r2 );

  value = x;

  return
end
