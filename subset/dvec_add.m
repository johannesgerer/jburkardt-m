function dvec3 = dvec_add ( n, dvec1, dvec2 )

%*****************************************************************************80
%
%% DVEC_ADD adds two (signed) decimal vectors.
%
%  Discussion:
%
%    A DVEC is an integer vector of decimal digits, intended to
%    represent an integer.  DVEC(1) is the units digit, DVEC(N-1)
%    is the coefficient of 10**(N-2), and DVEC(N) contains sign
%    information.  It is 0 if the number is positive, and 1 if
%    the number is negative.
%
%  Example:
%
%    N = 4
%
%      DVEC1     +   DVEC2     =   DVEC3
%
%    ( 0 0 1 7 ) + ( 0 1 0 4 ) = ( 0 0 1 2 1 )
%
%          17    +       104   =         121
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the length of the vectors.
%
%    Input, integer DVEC1(N), DVEC2(N), the vectors to be added.
%
%    Output, integer DVEC3(N), the sum of the two input vectors.
%
  base = 10;
  overflow = 0;

  dvec3(1:n) = floor ( dvec1(1:n) ) + floor ( dvec2(1:n) );

  for i = 1 : n
    while ( base <= dvec3(i) )
      dvec3(i) = dvec3(i) - base;
      if ( i < n )
        dvec3(i+1) = dvec3(i+1) + 1;
      else
        overflow = 1;
      end
    end
  end

  return
end
