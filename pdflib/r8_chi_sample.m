function value = r8_chi_sample ( df )

%*****************************************************************************80
%
%% R8_CHI_SAMPLE generates a Chi-Square random deviate.
%
%  Discussion:
%
%    This procedure generates a random deviate from the chi square distribution
%    with DF degrees of freedom random variable.
%
%    The algorithm exploits the relation between chisquare and gamma.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 July 2013
%
%  Author:
%
%    Original FORTRAN77 version by Barry Brown, James Lovato.
%    MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, real DF, the degrees of freedom.
%    0.0 < DF.
%
%    Output, real VALUE, a random deviate 
%    from the distribution.
%
  if ( df <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_CHI_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  DF <= 0.\n' );
    fprintf ( 1, '  Value of DF: %g\n', df );
    error ( 'R8_BETA_PDF - Fatal error!' );
  end

  arg1 = 1.0;
  arg2 = df / 2.0;

  value = 2.0 * r8_gamma_sample ( arg1, arg2 );

  return
end