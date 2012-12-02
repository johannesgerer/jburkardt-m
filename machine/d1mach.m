function value = d1mach ( i )

%*****************************************************************************80
%
%% D1MACH returns double precision real machine constants.
%
%  Discussion:
%
%    Assume that double precision real numbers are stored with a mantissa
%    of T digits in base B, with an exponent whose value must lie
%    between EMIN and EMAX.  Then for values of I between 1 and 5,
%    D1MACH will return the following values:
%
%      D1MACH(1) = B^(EMIN-1), the smallest positive magnitude.
%      D1MACH(2) = B^EMAX*(1-B^(-T)), the largest magnitude.
%      D1MACH(3) = B^(-T), the smallest relative spacing.
%      D1MACH(4) = B^(1-T), the largest relative spacing.
%      D1MACH(5) = log10(B)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 April 2007
%
%  Author:
%
%    Original FORTRAN77 version by Phyllis Fox, Andrew Hall, Norman Schryer
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Phyllis Fox, Andrew Hall, Norman Schryer,
%    Algorithm 528,
%    Framework for a Portable Library,
%    ACM Transactions on Mathematical Software,
%    Volume 4, Number 2, June 1978, page 176-188.
%
%  Parameters:
%
%    Input, integer I, chooses the parameter to be returned.
%    1 <= I <= 5.
%
%    Output, real VALUE, the value of the chosen parameter.
%
  if ( i < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'D1MACH - Fatal error!\n' );
    fprintf ( 1, '  The input argument I is out of bounds.\n' );
    fprintf ( 1, '  Legal values satisfy 1 <= I <= 5.\n' );
    fprintf ( 1, '  I = %d\n', i );
    value = 0.0;
    error ( 'D1MACH - Fatal error!' );
  elseif ( i == 1 )
    value = 1.112536929253601E-308;
  elseif ( i == 2 )
    value = 4.494232837155789E+307;
  elseif ( i == 3 )
    value = 1.110223024625157E-016;
  elseif ( i == 4 )
    value = 2.220446049250313E-016;
  elseif ( i == 5 )
    value = 0.301029995663981;
  elseif ( 5 < i )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'D1MACH - Fatal error!\n' );
    fprintf ( 1, '  The input argument I is out of bounds.\n' );
    fprintf ( 1, '  Legal values satisfy 1 <= I <= 5.\n' );
    fprintf ( 1, '  I = %d\n', i );
    value = 0.0;
    error ( 'D1MACH - Fatal error!' );
  end

  return
end
