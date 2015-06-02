function a = leslie ( b, di, da )

%*****************************************************************************80
%
%% LESLIE returns the LESLIE matrix.
%
%  Discussion:
%
%    This matrix is used in a model of population dynamics.
%
%  Formula:
%
%    5/6 * ( 1.0 - DI )    0      B         0
%    1/6 * ( 1.0 - DI )  13/14    0         0
%        0                1/14  39/40       0
%        0                 0     1/40  9/10 * ( 1 - DA )
%
%  Discussion:
%
%    A human population is assumed to be grouped into the categories:
%
%      X(1) = between  0 and  5+
%      X(2) = between  6 and 19+
%      X(3) = between 20 and 59+
%      X(4) = between 60 and 69+
%
%    Humans older than 69 are ignored.  Deaths occur in the 60 to 69
%    year bracket at a relative rate of DA per year, and in the 0 to 5
%    year bracket at a relative rate of DI per year.  Deaths do not occurr
%    in the other two brackets.
%
%    Births occur at a rate of B relative to the population in the
%    20 to 59 year bracket.
%
%    Thus, given the population vector X in a given year, the population
%    in the next year will be A * X.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Ke Chen, Peter Giblin, Alan Irving,
%    Mathematical Explorations with MATLAB,
%    Cambridge University Press, 1999,
%    ISBN: 0-521-63920-4.
%
%  Parameters:
%
%    Input, real B, DI, DA, the birth rate, infant mortality rate,
%    and aged mortality rate.  These should be positive values.
%    The mortality rates must be between 0.0 and 1.0.  Reasonable
%    values might be B = 0.025, DI = 0.010, and DA = 0.100
%
%    Output, real A(4,4), the matrix.
%
  a = zeros ( 4, 4 );

  if ( b < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LESLIE - Fatal error!\n' );
    fprintf ( 1, '  0 <= B is required.\n' );
    error ( 'LESLIE - Fatal error!' );
  end

  if ( da < 0.0 || 1.0 < da )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LESLIE - Fatal error!\n' );
    fprintf ( 1, '  0 <= DA <= 1.0 is required.\n' );
    error ( 'LESLIE - Fatal error!' );
  end

  if ( di < 0.0 || 1.0 < di )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LESLIE - Fatal error!\n' );
    fprintf ( 1, '  0 <= DI <= 1.0 is required.\n' );
    error ( 'LESLIE - Fatal error!' );
  end

  a(1,1) = 5.0 * ( 1.0 - di ) / 6.0;
  a(1,2) = 0.0;
  a(1,3) = b;
  a(1,4) = 0.0;

  a(2,1) = ( 1.0 - di ) / 6.0;
  a(2,2) = 13.0 / 14.0;
  a(2,3) = 0.0;
  a(2,4) = 0.0;

  a(3,1) = 0.0;
  a(3,2) = 1.0 / 14.0;
  a(3,3) = 39.0 / 40.0;
  a(3,4) = 0.0;

  a(4,1) = 0.0;
  a(4,2) = 0.0;
  a(4,3) = 1.0 / 40.0;
  a(4,4) = 9.0 * ( 1.0 - da ) / 10.0;

  return
end
