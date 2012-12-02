function bvec3 = ubvec_add ( n, bvec1, bvec2 )

%*****************************************************************************80
%
%% UBVEC_ADD adds two unsigned binary vectors.
%
%  Discussion:
%
%    A UBVEC is an integer vector of binary digits, intended to
%    represent a nonnegative integer.  BVEC(1) is the units digit, BVEC(N)
%    is the coefficient of 2**(N-1).
%
%  Example:
%
%    N = 4
%
%      BVEC1       +   BVEC2       =   BVEC3
%
%    ( 1 0 0 0 )   + ( 1 1 0 0 )   = ( 0 0 1 0 )
%
%      1           +   3           =   4
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 November 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the length of the vectors.
%
%    Input, integer BVEC1(N), BVEC2(N), the vectors to be added.
%
%    Output, integer BVEC3(N), the sum of the two input vectors.
%
  base = 2;
  overflow = 0;

  bvec3(1:n) = bvec1(1:n) + bvec2(1:n);

  for i = 1 : n
    while ( base <= bvec3(i) )
      bvec3(i) = bvec3(i) - base;
      if ( i < n )
        bvec3(i+1) = bvec3(i+1) + 1;
      else
        overflow = 1;
      end
    end
  end

  return
end
