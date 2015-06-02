function value = r8_uniform_01_sample ( )

%*****************************************************************************80
%
%% R8_UNIFORM_01_SAMPLE generates a uniform random deviate from [0,1].
%
%  Discussion:
%
%    This function should be the only way that the package accesses random
%    numbers.
%
%    Setting OPTION to 0 accesses the R8_UNI_01() function in RNGLIB,
%    for which there are versions in various languages, which should result
%    in the same values being returned.  This should be the only function
%    that invokes a function from RNGLIB.
%
%    Setting OPTION to 1 in the MATLAB version calls the system
%    RNG "rand()".
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
%    Original FORTRAN77 version by Barry Brown, James Lovato.
%    MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Output, real VALUE, a random deviate 
%    from the distribution.
%
  option = 0;

  if ( option == 0 )
    value = r8_uni_01 ( );
  else
    value = rand ( 1, 1 );
  end
 
  return
end
