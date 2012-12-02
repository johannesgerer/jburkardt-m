function p = vdc_numerator_sequence ( n )

%*****************************************************************************80
%
%% VDC_NUMERATOR_SEQUENCE: van der Corput numerator sequence base 2.
%
%  Discussion:
%
%    The classical van der Corput sequence, base 2, can be considered
%    as a way of enumerating the dyadic fractions P/2^K in an order of
%    increasing denominator.
%
%    If we fix a value of K, then the first (2^K) - 1 items in the
%    sequence are fractions strictly between 0 and 1, which can be written
%    as P/2^K where 0 < P < 2^K.
%
%    This function determines the numerator sequence, that is, the values
%    P, which is interesting in its own right.  Note that the P sequence
%    is "nested" in the sense that if 2^(K-1) <= N1 < N2 < 2^(K), then the
%    sequence for N2 will begin with the sequence for N1.
%
%    The I-th value in the sequence can be determined by writing
%    the integer I in binary using K digits, and reversing the order.
%
%    N = 10
%
%    2^3 = 8 <= 10 < 16 = 2^4
%
%    1  0001  1000   8
%    2  0010  0100   4
%    3  0011  1100  12
%    4  0100  0010   2
%    5  0101  1010  10
%    6  0110  0110   6
%    7  0111  1110  14
%    8  1000  0001   1
%    9  1001  1001   9
%   10  1010  0101   5
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 February 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    John Halton,
%    On the efficiency of certain quasi-random sequences of points
%    in evaluating multi-dimensional integrals,
%    Numerische Mathematik,
%    Volume 2, pages 84-90, 1960.
%
%    Johannes van der Corput,
%    Verteilungsfunktionen I & II,
%    Nederl. Akad. Wetensch. Proc.,
%    Volume 38, 1935, pages 813-820, pages 1058-1066.
%
%  Parameters:
%
%    Input, integer N, the number of elements to compute.
%
%    Output, integer P(N,1), the elements of the van der Corput numerator
%    sequence base 2.
%
  p = zeros ( n, 1 );

%  Carry out the computation.
%
  seed(1:n,1) = ( 1 : n )';

  while ( any ( seed ~= 0 ) )
    digit = mod ( seed, 2 );
    p = 2 * p + digit;
    seed = floor ( seed / 2 );
  end

  return
end
